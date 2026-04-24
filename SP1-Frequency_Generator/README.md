# SP1 - Frequency Generator

This stage implements a minimal arbitrary frequency generator. It is the first building block in the MP3-player training roadmap because it introduces controlled timing generation, which is later reused by waveform and audio-interface modules.

## What It Does

The RTL module increments an accumulator using a programmable input word and exposes one accumulator bit as the output clock. This is a classic digital frequency-generation technique based on accumulation and overflow.

## Main File

- [rtl/freq_gen.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP1-Frequency_Generator/rtl/freq_gen.sv)

## Why It Matters

This block is the timing foundation for later stages. In audio systems, sample generation and serial transmission both depend on predictable clock relationships.

## Simulation

The folder includes a simple testbench and Xcelium-oriented run scripts in `tb/`.
