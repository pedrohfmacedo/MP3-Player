# SP3 - I2S Transmitter

This stage implements a basic I2S transmitter for digital audio output. It is the first external audio interface in the project and is intended to connect generated or decoded samples to an audio DAC or codec.

## What It Does

The design serializes parallel audio data and generates the standard I2S-style control signals:

- `SCLK`
- `WS`
- `SD`

It also provides a `ready` signal to indicate when a new sample can be loaded.

## Main File

- [rtl/design.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP3-I2S_Transmitter/rtl/design.sv)

## Why It Matters

I2S is one of the most common digital-audio interfaces in FPGA boards and audio codecs. This stage connects the internal sample-processing path to a practical playback interface.

## Simulation

The folder includes a SystemVerilog testbench in `tb/` and a Cadence-oriented simulation script.
