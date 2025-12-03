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

## Video format support

The script now includes presets for common video output formats.

### MP4
```
convert input.mkv mp4
```
- H.264 video (`libx264`)
- AAC audio

### MKV
```
convert input.mp4 mkv
```
- H.264 video
- AAC audio

### WEBM
```
convert input.mp4 webm
```
- VP9 video (`libvpx-vp9`)
- Opus audio (`libopus`)
- Default bitrate: 2 Mbps

These presets make video conversion straightforward and consistent.

## Help flag

You can display usage information with:
```
convert -h
```
This shows available formats, GIF presets, and example usage.

## Folder batch mode

You can convert every file in a folder:
```
convert -f ./folder mp3
```

This will:
- Loop through all regular files in the folder
- Convert each file using the extension you provide
- Preserve the original filenames (only extension changes)

Example output:
```
Batch converting folder: ./videos to mp4
Converting: ./videos/clip1.mov
Converting: ./videos/clip2.mov
...
Batch conversion finished.
```

## Features 
- Single-file conversion
- Auto-generated output name
- Custom output filename support
- Overwrite prompt
- GIF Conversion
- Audio Conversion/Extraction
- Video Conversion
- Help flag (-h)
