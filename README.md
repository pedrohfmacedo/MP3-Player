# MP3 Player

This repository contains a staged hardware development path toward an FPGA/SoC-based MP3 player. Instead of starting from the full system at once, the project is divided into smaller subproducts (`SP1` to `SP6`), each one introducing an important audio-processing or interface block.

The approach follows the training plan described in:

- [Plano de projeto para treinamento em microeletrônica.pdf](/home/xmen/Desktop/meu_git/MP3-Player/Plano%20de%20projeto%20para%20treinamento%20em%20microeletr%C3%B4nica.pdf)
- [13818-3.pdf](/home/xmen/Desktop/meu_git/MP3-Player/13818-3.pdf)

## Overview

The final goal is an MP3-capable digital audio system with SD-card input and digital audio output. The current repository captures the intermediate milestones that gradually build the required knowledge and reusable RTL blocks.

The implemented steps in this repository include:

- `SP1`: frequency generation
- `SP2`: waveform generation
- `SP3`: I2S transmission
- `SP4`: SPDIF / AES3 transmission
- `SP5`: ADPCM decoding
- `SP6`: early MP2 decoding blocks

## Development Philosophy

This project follows a "learn by building" flow. Each stage is small enough to be understood on its own, but also contributes to the architecture of a larger audio playback system.

In practice, the sequence evolves from:

1. timing generation
2. sample generation
3. audio output interfaces
4. compressed-audio decoding
5. integration toward a complete player

## Repository Structure

```text
MP3-Player/
├── SP1-Frequency_Generator/
├── SP2-Waveform_Generator/
├── SP3-I2S_Transmitter/
├── SP4-SPDIF-AES3/
├── SP5-ADPCM/
├── SP6-MP2/
├── 13818-3.pdf
├── Plano de projeto para treinamento em microeletrônica.pdf
└── mpeg audio.pptx
```

## Notes

- Most subprojects are organized with `rtl/` and `tb/` folders.
- Several simulation scripts target a Cadence Xcelium-based flow.
- The MP2-related folder represents an early decoding step inspired by MPEG audio standards and is useful as a structural milestone even when not yet a complete production decoder.

## Tools

- SystemVerilog
- Cadence Xcelium / `xrun`
- Linux-based development flow

## Subprojects

- [SP1-Frequency_Generator](/home/xmen/Desktop/meu_git/MP3-Player/SP1-Frequency_Generator/README.md)
- [SP2-Waveform_Generator](/home/xmen/Desktop/meu_git/MP3-Player/SP2-Waveform_Generator/README.md)
- [SP3-I2S_Transmitter](/home/xmen/Desktop/meu_git/MP3-Player/SP3-I2S_Transmitter/README.md)
- [SP4-SPDIF-AES3](/home/xmen/Desktop/meu_git/MP3-Player/SP4-SPDIF-AES3/README.md)
- [SP5-ADPCM](/home/xmen/Desktop/meu_git/MP3-Player/SP5-ADPCM/README.md)
- [SP6-MP2](/home/xmen/Desktop/meu_git/MP3-Player/SP6-MP2/README.md)
