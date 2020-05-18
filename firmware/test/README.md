# icepool-firmware

[TODO tests passing widget]

## Dependencies

The tests are not designed to be run on the icepool MCU. Rather, they are designed to run on a development machine using a desktop OS. Due to a dependency on clang and libc, Linux is preferred.

The tests require the following dependencies:

* [&mu;nit](), a small testing framework written in C (provided; MIT license)
  * libc
* clang
* make

## Running Tests

To run all the tests, run:

   $ make test

