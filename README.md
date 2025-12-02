# Convert
A simple wrapper script (Fish shell) for running ffmpeg conversions more easily.

## Goals
- Make video/audio conversion easier with a simple `convert` function

## Usage

### Basic conversion
```

convert <input-file> <extension>

```

Example:
You can provide your own full output filename:
```

convert video.mp4 newname.mkv

```
Or just an extension:
```

convert video.mp4 mkv

```

### Overwrite protection
If the output file already exists, the script will ask:

```

'output.mkv' already exists. Overwrite? (y/N):

```

This prevents accidental data loss.

## GIF conversion modes

The script includes three GIF presets:

### Standard GIF
```
convert input.mp4 gif

```
- 12 FPS  
- 480px width  
- Lanczos scaling


### Fast GIF
```
convert input.mp4 giffast

```
- 10 FPS  
- 360px width  
- Faster and smaller file sizes


### High-quality GIF
```
convert input.mp4 gifhq

```
- 15 FPS  
- 720px width  
- Lanczos scaling for high quality

These modes make GIF generation simple and consistent.

## Audio format support

The script now supports audio extraction and conversion:

### MP3
```
convert video.mp4 mp3
```
- Uses `libmp3lame`
- Good quality (q:a 2)

### WAV
```
convert video.mp4 wav
```
- Raw uncompressed audio

### FLAC
```
convert video.mp4 flac
```
- Lossless compression

### OGG (Vorbis)
```
convert video.mp4 ogg
```
- Vorbis codec, quality level 5

These formats allow you to quickly extract or convert audio using ffmpeg.

## Features 
- Single-file conversion
- Auto-generated output name
- Custom output filename support
- Overwrite prompt
- GIF Conversion
- Audio Conversion/Extraction
