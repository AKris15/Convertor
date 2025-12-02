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
