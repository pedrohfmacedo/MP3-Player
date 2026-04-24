# SP6 - MP2

This stage represents the transition from simple audio coding toward MPEG audio decoding. It is inspired by the MPEG-2 audio standard and the project roadmap that identifies MP2 as a major intermediate milestone before a full MP3-capable system.

## What It Does

The current folder contains early decoding-oriented building blocks such as:

- a bitstream separator
- a Huffman decoder
- a ROM-based support block

These modules reflect the structure of a layered audio decoder, where bitstream parsing and coded-symbol reconstruction are separated into dedicated blocks.

## Main Files

- [rtl/Bitstream_separator.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP6-MP2/rtl/Bitstream_separator.sv)
- [rtl/Decoder_Huffman.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP6-MP2/rtl/Decoder_Huffman.sv)
- [rtl/ROM.sv](/home/xmen/Desktop/meu_git/MP3-Player/SP6-MP2/rtl/ROM.sv)

## Why It Matters

Compared to the earlier stages, this one is less about output formatting and more about codec internals. It introduces bitstream interpretation, symbol decoding, and the kind of modular decomposition required by MPEG audio decoders.

## Status

This folder should be read as an early architectural and educational step toward MP2/MP3 decoding, not as a complete final decoder.
