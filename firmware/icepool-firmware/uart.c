#include "sam.h"
#include "component/gclk.h"
#include "component/pm.h"
#include "component/sysctrl.h"
#include "component/port.h"

#include "uart.h"

static uint16_t _uart_baud_arithmetic(uint32_t baudrate, uint32_t cpu_freq);
static uint16_t _uart_baud_fractional(uint32_t baudrate, uint32_t cpu_freq);

static void (*_uart_on_read)(uint8_t, void*);
static void (*_uart_on_write)(void*);

static void* _uart_on_read_param = NULL;
static void* _uart_on_write_param = NULL;

void uart_init(uint32_t baudrate)
{   
    // Enable core clock for SERCOM0 and APB clock for SERCOM0
    
    GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_SERCOM0_CORE | // ID = SERCOM0_CORE
                        GCLK_CLKCTRL_GEN_GCLK3       | // GEN = GCLK3
                        GCLK_CLKCTRL_CLKEN;            // CLKEN = 1 (enable)
                                                       // (single 16-bit write required)

    while(GCLK->STATUS.bit.SYNCBUSY == 1);
    
    PM->APBCSEL.bit.APBCDIV   = 0; // No prescaler on APB clock
    PM->APBCMASK.bit.SERCOM0_ = 1; // Enable APB clock for SERCOM0
    
    // Configure SERCOM0 pins
    
    // ... set up PMUX using WRCONFIG
    PORT->Group[0].WRCONFIG.reg = PORT_WRCONFIG_WRPINCFG      | // Set PINCFG
                                  PORT_WRCONFIG_WRPMUX        | // Set PMUX
                                  PORT_WRCONFIG_PMUXEN        | // Enable PMUXing
                                  PORT_WRCONFIG_PMUX(0x03)    | // Use SERCOM-ALT ("Function D")
                                  PORT_WRCONFIG_PINMASK(1<<4) | // PA4
                                  PORT_WRCONFIG_PINMASK(1<<6);  // PA6

    // Configure SERCOM0 for UART with 8n1, auto-baud, 16x oversampling, etc.
    
    SERCOM0->USART.CTRLA.bit.SWRST  = 1;           // Reset USART
    while(SERCOM0->USART.SYNCBUSY.bit.SWRST != 0); // ... wait for sync
    
    SERCOM0->USART.CTRLA.bit.ENABLE = 0;            // Disable USART
    while(SERCOM0->USART.SYNCBUSY.bit.ENABLE != 0); // ... wait for sync
    while(SERCOM0->USART.CTRLA.bit.ENABLE != 0) ;   // ... wait for sync

    //SERCOM0->USART.BAUD.reg = _uart_baud_arithmetic(baudrate, CPU_FREQ); // Set baud rate
    SERCOM0->USART.BAUD.reg = _uart_baud_fractional(baudrate, CPU_FREQ); // Set baud rate

    SERCOM0->USART.CTRLA.bit.MODE     = 1;    // Set operating mode (use internal clock)
    SERCOM0->USART.CTRLA.bit.CMODE    = 0;    // Set communication mode (asynchronous mode)
    SERCOM0->USART.CTRLA.bit.RXPO     = 0x2;  // Use PAD[2] for RX
    SERCOM0->USART.CTRLA.bit.TXPO     = 0x0;  // Use PAD[0] for TX (PAD[1] for XCK)
    SERCOM0->USART.CTRLB.bit.CHSIZE   = 0;    // Set word size (8-bit words)
    SERCOM0->USART.CTRLA.bit.DORD     = 1;    // Set data ordering (LSB-first)
    //SERCOM0->USART.CTRLA.bit.SAMPR    = 0x0;  // Set number of samples per bit (16x, fractional)
    SERCOM0->USART.CTRLA.bit.SAMPR    = 0x1;  // Set number of samples per bit (16x, fractional)
    //SERCOM0->USART.CTRLA.bit.FORM     = 0x00; // Set frame format (16x oversampling, no parity)
    SERCOM0->USART.CTRLA.bit.FORM     = 0x04; // Set frame format (auto-baud, no parity)
    
    SERCOM0->USART.CTRLB.bit.PMODE    = 0;    // Set parity mode (no parity bit)
    SERCOM0->USART.CTRLB.bit.SBMODE   = 0;    // Set stop bit mode (one stop bit)
    
    SERCOM0->USART.CTRLB.bit.RXEN = 1;              // Enable receive buffer
    while(SERCOM0->USART.SYNCBUSY.bit.CTRLB != 0);  // .. wait for SYNC
    
    SERCOM0->USART.CTRLB.bit.TXEN = 1;              // Enable transmit buffer
    while(SERCOM0->USART.SYNCBUSY.bit.CTRLB != 0);  // .. wait for SYNC
    
    // UART starts in a disabled state.
    // Use uart_enable() to enable it.
}

void uart_enable()
{
    SERCOM0->USART.CTRLA.bit.ENABLE = 1;            // Enable USART
    while(SERCOM0->USART.SYNCBUSY.bit.ENABLE != 0); // ... wait for SYNC
    while(SERCOM0->USART.CTRLA.bit.ENABLE == 0) ;   // ... wait for SYNC
}

void uart_disable()
{
    SERCOM0->USART.CTRLA.bit.ENABLE = 0;            // Disable USART
    while(SERCOM0->USART.SYNCBUSY.bit.ENABLE != 0); // ... wait for SYNC
    while(SERCOM0->USART.CTRLA.bit.ENABLE == 0) ;   // ... wait for SYNC
}

uint8_t uart_read()
{
    while(SERCOM0->USART.INTFLAG.bit.RXC == 0);
    return (uint8_t) (SERCOM0->USART.DATA.reg & 0xFF);
}

void uart_write(const uint8_t payload)
{
    while(SERCOM0->USART.INTFLAG.bit.DRE == 0);
    SERCOM0->USART.DATA.reg = (uint16_t) payload;
}

size_t uart_write_n(const uint8_t* payload, size_t length)
{
    size_t count;
    
    for (count = 0; count < length; count++)
    {
        uart_write(payload[count]);
    }
    
    return count;
}

size_t uart_read_n(uint8_t* buffer, size_t length_max)
{
    size_t count;
    
    for (count = 0 ; count < length_max; count++)
    {
        buffer[count] = uart_read();
    }
    
    return count;
}

uint16_t _uart_baud_arithmetic(uint32_t baudrate, uint32_t cpu_freq)
{
    // Compute the BAUD register value `baud_reg` using the following formula (async operation):
    //
    //   baud_reg = 65536 * (1 - S * fbaud/fcpu)
    //            = 0x10000 - ((fbaud * S) * 0x10000) / fcpu
    //            = 0x10000 - ((fbaud << log2(S)) << 16) / fcpu
    //
    // Here, S = 16.
    // TODO support S = 3, 8, 16
    
    uint32_t baudreg = 0x10000UL - (((baudrate << 4) << 16) / cpu_freq);
    
    return (uint16_t)(baudreg & 0xFFFF);
}

uint16_t _uart_baud_fractional(uint32_t baudrate, uint32_t cpu_freq)
{
    // Compute the BAUD register value from the following formula (Table 25-2)
    //
    //   BAUD = fref / (S * fbaud) - FP / 8
    //
    // where S is number of samples per bit (=16), and FP is the fractional part,
    // FP = (0, 8]    
    //
    // TODO support S = 3, 8, 16
    //
    // Multiplying both sides by 8, the formula becomes
    //
    //   8 * BAUD = 8 * fref / (16 * fbaud) - FP
    //
    // Letting FP = 0 for now (auto-baud), then we're left with
    //
    //   BAUD = (8 * BAUD) / 8
    //     FP = (8 * BAUD) % 8 = 0
    
    uint32_t baud8 = ((cpu_freq << 3) / (baudrate << 4));
    
    return (uint16_t) ((((baud8 % 8) << 13) | (baud8 / 8)) & 0xFFFF);
}

void uart_enable_interrupts()
{
    // Enable IRQ in NVIC
    NVIC_SetPriority(SERCOM0_IRQn, (1<<__NVIC_PRIO_BITS) - 1);
    NVIC_EnableIRQ(SERCOM0_IRQn);
    
    // Enable interrupts in SERCOM
    
    SERCOM0->USART.INTENSET.bit.TXC = 1;
    SERCOM0->USART.INTENSET.bit.RXC = 1;
}

void uart_disable_interrupts()
{
    // Disable interrupts in SERCOM
    SERCOM0->USART.INTENCLR.bit.TXC = 1;
    SERCOM0->USART.INTENCLR.bit.RXC = 1;
    
    // Disable IRQ in NVIC
    NVIC_DisableIRQ((SERCOM0_IRQn));
}

// SERCOM0_Handler is defined as a weak reference in `startup_samd21.c`
// and links to `DummyHandler` by default. Here, we define a strong reference
// which the linker should use instead.
void SERCOM0_Handler()
{
    // Handle RXC interrupt
    if (SERCOM0->USART.INTFLAG.bit.RXC == 1)
    {
        // Read the byte, clearing the RXC flag
        uint8_t d = uart_read();
        
        // Callback that data has been read
        if (_uart_on_read)
            (*_uart_on_read)(d, _uart_on_read_param);
    }
    
    // Handle TXC interrupt
    if (SERCOM0->USART.INTFLAG.bit.TXC == 1)
    {   
        // Clear TXC flag, to prevent interrupts from continuously firing.
        SERCOM0->USART.INTFLAG.bit.TXC = 1;
        
        // FIXME Writing to TXC generates a compiler warning. TXC defined
        //       as read-only. However, the datasheet says this flag can be
        //       cleared by writing a 1 to it.
        
        // Callback that data has been written
        if (_uart_on_write)
            (*_uart_on_write)(_uart_on_write_param);
    }
}

void uart_set_on_write(void (*on_write)(void*), void* param)
{
    _uart_on_write = on_write;
    _uart_on_write_param = param;
}

void uart_set_on_read(void (*on_read)(uint8_t, void*), void* param)
{
    _uart_on_read = on_read;
    _uart_on_read_param = param;
}