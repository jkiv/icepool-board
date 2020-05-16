#ifndef NET_INTERFACE_H_
#define NET_INTERFACE_H_

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
} NetInterface;

#endif /* NET_INTERFACE_H_ */