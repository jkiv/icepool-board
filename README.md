icepool-board
=============

## About

KiCad 5 design files for the *icepool* project.

*icepool* is a FPGA cluster and development board.

Key features include,

- 16x headers for daughter boards.
- An FT2232H for USB communication and parallel FPGA flashing.
- One-to-many SPI interface for sending data from the PC to each daughter board.
- Daisy-chained SPI interface for passing data to and from the PC and each daughter board.
- A 6-pin ATX +12V power connector for use with conventional PC power supplies.



![icepool-board - 3D Render](hardware/images/icepool-board_profile.png)

Currently, the project includes a daughter board design featuring a single ice40hx8k-bg121 FGPA with independent LDO, 12MHz oscillator, and indicator LED.

<img src="C:\Users\Stream\Desktop\icepool-board\hardware\images\icepool-ice40hx8k-daughterboard-profile.png" alt="ice40hx8k bg121 daughter board - 3D render" style="zoom:50%;" />

Please consider supporting this project and others like it by donating:

* XBT: 13zRrs1YDdooUN5WtfXRSDn8KnJdok4qG9

## Drivers

See [jkiv/icepool-driver](https://github.com/jkiv/icepool-driver) project for a general purpose Linux C library which relies on `libftdi`.

## Dependencies

This project depends on the following KiCad libraries:

* [Digi-Key/digikey-kicad-library](https://github.com/Digi-Key/digikey-kicad-library)
* [jkiv/jkiv-kicad-library](https://github.com/jkiv/jkiv-kicad-library)

These repositories must be cloned into `hardware/external/`.

For example, starting at the repo root directory:

    $ cd hardware/external/
    $ git clone https://github.com/Digi-Key/digikey-kicad-library.git
    $ git clone https://github.com/jkiv/jkiv-kicad-library.git 
