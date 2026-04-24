# SP5 - ADPCM

This stage introduces compressed-audio decoding with an ADPCM decoder. It is an important step because the project moves from waveform generation and transport into actual audio decompression.

## What It Does

The RTL implements a decoder structure based on:

- step-size lookup
- index update logic
- predicted sample reconstruction
- dequantized difference accumulation

The current implementation is aligned with the idea of a simple ADPCM decompressor stage, as suggested by the training plan.

## Main File

- [rtl/design.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP5-ADPCM/rtl/design.sv)

## Why It Matters

ADPCM is a good educational bridge into audio coding because it is much simpler than MPEG audio decoding, while still introducing stateful decompression and sample reconstruction.

## Simulation

The folder includes a basic testbench in `tb/` for functional experimentation.
