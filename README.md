# Lilt

| Currently in the works! |
| - |

A proof-of-concept/working demo of a rhythm game based off EVAST9919's "Swing" ruleset
for osu!lazer, made with Godot 4.

Eventually, I would like to build a fully-fledged rhythm game out of this with my own
spin on it. This project exists to test the feasability of the concept for mobile devices.

Licensed under the GNU General Public License, version 2. See the [LICENCE](LICENCE)
file for more information.

- [Installation](#installation)
- [How to Play](#how-to-play)
- [Scores](#scores)
- [Third Party Open Source Licences](#third-party-open-source-licences)

## Installation

WIP

<!--

Download a pre-built binary through the
[Releases](https://github.com/markjoshwel/Lilt/releases) page, or using a link below.

| [Windows 7+ (64-bit)](https://github.com/markjoshwel/Lilt/releases/latest/download/lilt-windows.zip) | [Android 5+ (arm64-v8a)](https://github.com/markjoshwel/Lilt/releases/latest/download/lilt-android.zip) | [Data Pack](https://github.com/markjoshwel/Lilt/releases/latest/download/lilt-data.pck) |
| ------------ | ------------- | ------------- |

Upgrading from an older version? Download the latest **Data Pack** and replace the old `lilt-data.pck` with it.

If your platform isn't available, you can clone the Git repository and export the Godot
project for your own platform. See the
[Godot docs](https://docs.godotengine.org/en/stable/tutorials/export/index.html) for more
information.

-->

## Scores

_(Also known in other rhythm games as beatmaps, charts, levels, etc.)_

Lilt does not come with any pre-packaged scores due to potential copyright issues.
However, you may obtain **community-made** scores in
[this discussion page](https://github.com/markjoshwel/Lilt/discussions/1).

<!--
Lilt also comes with a built-in editor to create and share your own scores.
-->

### Technical Information

Scores are Godot Data Pack (*.pck) files containing three files:

- `meta.json`  
  JSON file containing all [song and timing metadata](#score-metadata)
- `song.mp3`
- `cover.jpg`

This can be done using the PCKPacker object in Godot.

#### Metadata

- Example:

  ```json
  {
  	"lilt file format version": 1,
  	"artist": "Loli in early 20s",
  	"title": "put the knife away",
  	"bpm": 89,
  	"signature": [4, 4],
  	"timings": [
  		[0, 4, 1, 4, 1, 0, 0]
  	] 
  }
  ```

Signature of `[4, 4]` is 

- `timings` Format:

  1. `bar_number` (int)
  2. `bar_count` (int)
  3. `note_length_numerator` (int)
  4. `note_length_denominator` (int)
  5. [`note_start_type`](#note-types) (int)
  6. [`note_end_type` ](#note-types) (int)
  7. extra data  
     currently used for repeat note end types to count times to repeat note

  Notes are treated as sliders if `note_end_type` is not `0`.

- Note Types

  0. Empty / Break (also used to determine if a note is a slider)
  1. Standard Note
  2. Flick Up
  3. Flick Right
  4. Flick Down
  5. Flick Left
  6. Repeat (only note_end_type)

  Examples in format `[note_start_type, note_end_type]`:

  - `[1, 0]`: Standard note
  - `[2, 0]`: Flick up note
  - `[1, 1]`: Standard slider
  - `[1, 2]`: Slider with flick up end

## How to Play

WIP

## Third Party Open Source Licences

### Open Font License 1.1

1. [**IBM Plex Sans**](https://github.com/IBM/plex)

   Location: `/assets/thirdparty/IBM-Plex-Sans*/*`
   
   ```
   Copyright © 2017 IBM Corp. with Reserved Font Name "Plex"
   
   This Font Software is licensed under the SIL Open Font License,    Version 1.1.
   This license is copied below, and is also available with a FAQ at:
   http://scripts.sil.org/OFL
   
   -----------------------------------------------------------
   SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
   -----------------------------------------------------------
   
   PREAMBLE
   The goals of the Open Font License (OFL) are to stimulate worldwide
   development of collaborative font projects, to support the font    creation
   efforts of academic and linguistic communities, and to provide a free    and
   open framework in which fonts may be shared and improved in partnership
   with others.
   
   The OFL allows the licensed fonts to be used, studied, modified and
   redistributed freely as long as they are not sold by themselves. The
   fonts, including any derivative works, can be bundled, embedded, 
   redistributed and/or sold with any software provided that any reserved
   names are not used by derivative works. The fonts and derivatives,
   however, cannot be released under any other type of license. The
   requirement for fonts to remain under this license does not apply
   to any document created using the fonts or their derivatives.
   
   DEFINITIONS
   "Font Software" refers to the set of files released by the Copyright
   Holder(s) under this license and clearly marked as such. This may
   include source files, build scripts and documentation.
   
   "Reserved Font Name" refers to any names specified as such after the
   copyright statement(s).
   
   "Original Version" refers to the collection of Font Software    components as
   distributed by the Copyright Holder(s).
   
   "Modified Version" refers to any derivative made by adding to,    deleting,
   or substituting -- in part or in whole -- any of the components of the
   Original Version, by changing formats or by porting the Font Software    to a
   new environment.
   
   "Author" refers to any designer, engineer, programmer, technical
   writer or other person who contributed to the Font Software.
   
   PERMISSION & CONDITIONS
   Permission is hereby granted, free of charge, to any person obtaining
   a copy of the Font Software, to use, study, copy, merge, embed, modify,
   redistribute, and sell modified and unmodified copies of the Font
   Software, subject to the following conditions:
   
   1) Neither the Font Software nor any of its individual components,
   in Original or Modified Versions, may be sold by itself.
   
   2) Original or Modified Versions of the Font Software may be bundled,
   redistributed and/or sold with any software, provided that each copy
   contains the above copyright notice and this license. These can be
   included either as stand-alone text files, human-readable headers or
   in the appropriate machine-readable metadata fields within text or
   binary files as long as those fields can be easily viewed by the user.
   
   3) No Modified Version of the Font Software may use the Reserved Font
   Name(s) unless explicit written permission is granted by the    corresponding
   Copyright Holder. This restriction only applies to the primary font    name as
   presented to the users.
   
   4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
   Software shall not be used to promote, endorse or advertise any
   Modified Version, except to acknowledge the contribution(s) of the
   Copyright Holder(s) and the Author(s) or with their explicit written
   permission.
   
   5) The Font Software, modified or unmodified, in part or in whole,
   must be distributed entirely under this license, and must not be
   distributed under any other license. The requirement for fonts to
   remain under this license does not apply to any document created
   using the Font Software.
   
   TERMINATION
   This license becomes null and void if any of the above conditions are
   not met.
   
   DISCLAIMER
   THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
   OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
   COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
   INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
   DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
   OTHER DEALINGS IN THE FONT SOFTWARE.
   ```
   
2. [**Trispace**](https://github.com/Etcetera-Type-Co/Trispace)
   
   Location: `/assets/thirdparty/Trispace-RC1/`
   
   ```
   Copyright 2020 The Trispace Project Authors (https://github.com/   Etcetera-Type-Co/Trispace)
   
   This Font Software is licensed under the SIL Open Font License,    Version 1.1.
   This license is copied below, and is also available with a FAQ at:
   https://scripts.sil.org/OFL
   
   
   -----------------------------------------------------------
   SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
   -----------------------------------------------------------
   
   PREAMBLE
   The goals of the Open Font License (OFL) are to stimulate worldwide
   development of collaborative font projects, to support the font    creation
   efforts of academic and linguistic communities, and to provide a free    and
   open framework in which fonts may be shared and improved in partnership
   with others.
   
   The OFL allows the licensed fonts to be used, studied, modified and
   redistributed freely as long as they are not sold by themselves. The
   fonts, including any derivative works, can be bundled, embedded, 
   redistributed and/or sold with any software provided that any reserved
   names are not used by derivative works. The fonts and derivatives,
   however, cannot be released under any other type of license. The
   requirement for fonts to remain under this license does not apply
   to any document created using the fonts or their derivatives.
   
   DEFINITIONS
   "Font Software" refers to the set of files released by the Copyright
   Holder(s) under this license and clearly marked as such. This may
   include source files, build scripts and documentation.
   
   "Reserved Font Name" refers to any names specified as such after the
   copyright statement(s).
   
   "Original Version" refers to the collection of Font Software    components as
   distributed by the Copyright Holder(s).
   
   "Modified Version" refers to any derivative made by adding to,    deleting,
   or substituting -- in part or in whole -- any of the components of the
   Original Version, by changing formats or by porting the Font Software    to a
   new environment.
   
   "Author" refers to any designer, engineer, programmer, technical
   writer or other person who contributed to the Font Software.
   
   PERMISSION & CONDITIONS
   Permission is hereby granted, free of charge, to any person obtaining
   a copy of the Font Software, to use, study, copy, merge, embed, modify,
   redistribute, and sell modified and unmodified copies of the Font
   Software, subject to the following conditions:
   
   1) Neither the Font Software nor any of its individual components,
   in Original or Modified Versions, may be sold by itself.
   
   2) Original or Modified Versions of the Font Software may be bundled,
   redistributed and/or sold with any software, provided that each copy
   contains the above copyright notice and this license. These can be
   included either as stand-alone text files, human-readable headers or
   in the appropriate machine-readable metadata fields within text or
   binary files as long as those fields can be easily viewed by the user.
   
   3) No Modified Version of the Font Software may use the Reserved Font
   Name(s) unless explicit written permission is granted by the    corresponding
   Copyright Holder. This restriction only applies to the primary font    name as
   presented to the users.
   
   4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
   Software shall not be used to promote, endorse or advertise any
   Modified Version, except to acknowledge the contribution(s) of the
   Copyright Holder(s) and the Author(s) or with their explicit written
   permission.
   
   5) The Font Software, modified or unmodified, in part or in whole,
   must be distributed entirely under this license, and must not be
   distributed under any other license. The requirement for fonts to
   remain under this license does not apply to any document created
   using the Font Software.
   
   TERMINATION
   This license becomes null and void if any of the above conditions are
   not met.
   
   DISCLAIMER
   THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
   OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
   COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
   INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
   DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
   OTHER DEALINGS IN THE FONT SOFTWARE.
   ```
