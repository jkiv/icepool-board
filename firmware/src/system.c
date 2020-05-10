#include "sam.h"
#include "component/gclk.h"
#include "component/pm.h"
#include "component/sysctrl.h"
#include "component/port.h"

#include "system.h"

static void _system_init_sysclk();
static void _system_init_clkgen();
static void _system_init_gpio();

// Set up clocks, clock generators, and GPIO
void system_init()
{
    _system_init_sysclk();
    _system_init_clkgen();
    _system_init_gpio();   
}

static void _system_init_sysclk()
{
    // SW Reset
    // TODO --
    
    // Call Atmel Studio initialization
    SystemInit();
    
    // Set up OSC8M
    SYSCTRL->OSC8M.bit.PRESC  = 0; // No prescale on OSC8M
    SYSCTRL->OSC8M.bit.ENABLE = 1; // Ensure OSC8M is enabled
    
    // ... Default state after reset is OSC8M -> Gen 0 -> GCLK_MAIN
    //     No need to set that up right now.
}

static void _system_init_clkgen()
{
    // Set up Generator 3 for SERCOM 0
    
    GCLK->GENDIV.reg = GCLK_GENDIV_ID(0x03) | // ID = 0x03 (Generator 3)
                       GCLK_GENDIV_DIV(0);    // DIV = 0 (no prescaler)
                                              // (single 32-bit write required)

    while(GCLK->STATUS.bit.SYNCBUSY == 1); // ... wait for sync
    
    GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(0x03)  | // ID = 0x03, Generator 3
                        GCLK_GENCTRL_SRC_OSC8M | // SRC = OSC8M
                        GCLK_GENCTRL_GENEN;      // Enable generator
                                                 // DIVSEL = 0
                                                 // (single 32-bit write required)

    while(GCLK->STATUS.bit.SYNCBUSY == 1); // ... wait for sync
}

static void _system_init_gpio()
{
    // TODO
    // - ~SS_B[0-3]
    // - CDONE
    // - CRESET_B
    // - READY
    // - (~GS)
    
    // TODO SPI
    // - MISO
    // - MOSI
    // - GMOSI
    // - ~WE
    // - (~GS)
}