# SP4 - SPDIF / AES3

This stage explores an alternative digital-audio output path using SPDIF / AES3 concepts. Instead of a multi-signal audio bus like I2S, the encoded stream is transmitted through a single data line.

## What It Does

The current implementation focuses on:

- a clock divider
- SPDIF-style signal generation
- Differential Manchester / biphase-mark style data encoding

This matches the training-plan idea of sending clock and data information over a single encoded output.

## Main Files

- [rtl/design.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP4-SPDIF-AES3/rtl/design.sv)
- [rtl/clock_divisor.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP4-SPDIF-AES3/rtl/clock_divisor.sv)

## Why It Matters

This stage shows a different tradeoff from I2S: the interface becomes simpler at the pin level, but the encoding logic becomes more specialized.

## Simulation

The `tb/` folder contains testbenches for both the main encoder logic and the clock-divider support block.
