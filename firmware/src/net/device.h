#ifndef NET_DEVICE_H_
#define NET_DEVICE_H_

typedef struct {
    // write byte
    void (*write)(uint8_t);
    // read byte
    uint8_t (*read)();
    // enable rx
    void (*rx_enable)();
    // disable rx
    void (*rx_disable)();
    // enable tx
    void (*tx_enable)();
    // disable tx
    void (*tx_disable)();
} NetDevice;

#endif /* NET_DEVICE_H_ */