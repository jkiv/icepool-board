#ifndef NET_INTERFACE_H_
#define NET_INTERFACE_H_

typedef struct {
    void (*write)(uint8_t, void*);
    uint8_t (*read)(void*);
    void (*rx_enable)(void*);
    void (*rx_disable)(void*);
    void (*tx_enable)(void*);
    void (*tx_disable)(void*);
    
    void* params;
} NetInterface;

#endif /* NET_INTERFACE_H_ */