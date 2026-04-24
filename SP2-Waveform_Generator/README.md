# SP2 - Waveform Generator

This stage expands the frequency generator into a waveform generator. It produces sample streams that can represent simple audio-like signals and musical tones.

## What It Does

The design combines a programmable frequency source with lookup tables for waveform synthesis. The current implementation includes waveform ROM/LUT blocks for:

- sine
- rectangular
- sawtooth

The output is selected by waveform control logic.

## Main Files

- [rtl/wave_gen.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP2-Waveform_Generator/rtl/wave_gen.sv)
- [rtl/lut_sin.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP2-Waveform_Generator/rtl/lut_sin.sv)
- [rtl/lut_rectangular.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP2-Waveform_Generator/rtl/lut_rectangular.sv)
- [rtl/lut_sawtooth.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP2-Waveform_Generator/rtl/lut_sawtooth.sv)

## Why It Matters

This is the first stage that turns timing into actual sample values. It is a useful intermediate step between clock generation and real digital-audio output interfaces.

## Simulation

The folder contains a dedicated `tb/` environment for functional checks.
