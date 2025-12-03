# Convert

![Shell](https://img.shields.io/badge/shell-fish-blue?style=for-the-badge)

A lightweight and convenient Fish-shell wrapper around **ffmpeg**, designed to simplify everyday media conversion.
Provides clean syntax, sensible defaults, GIF presets, batch processing, overwrite protection, and support for all major audio/video formats.

---

## ✨ Features

* 🎥 Video conversion (MP4, MKV, WEBM)
* 🎵 Audio extraction & conversion (MP3, WAV, FLAC, OGG)
* 🖼️ GIF presets (standard, fast, HQ)
* 📁 Folder batch mode (`-f`)
* 🔄 Auto output naming
* ✏️ Custom filename support
* ⚠️ Overwrite protection
* 💡 Help command (`-h`)
* 🐟 Native Fish-shell function

---

## 🚀 Installation

### **Install directly from GitHub (recommended)**

```sh
curl -o ~/.config/fish/functions/convert.fish https://raw.githubusercontent.com/AKris15/Convertor/main/convert.fish
```

Or:

```sh
wget -O ~/.config/fish/functions/convert.fish https://raw.githubusercontent.com/AKris15/Convertor/main/convert.fish
```

Reload Fish:

```sh
exec fish
```

---

## 📘 Usage

### Basic Conversion

```
convert <input-file> <extension>
```

Examples:

```
convert video.mp4 mkv
convert video.mp4 newname.mkv
```

---

## 🔄 Overwrite Protection

If a file already exists:

```
'output.mkv' already exists. Overwrite? (y/N):
```

---

## 🖼️ GIF Conversion Modes

### Standard GIF

```
convert input.mp4 gif
```

### Fast GIF

```
convert input.mp4 giffast
```

### High-quality GIF

```
convert input.mp4 gifhq
```

---

## 🎵 Audio Format Support

```
convert video.mp4 mp3
convert video.mp4 wav
convert video.mp4 flac
convert video.mp4 ogg
```

---

## 🎥 Video Format Support

```
convert input.mkv mp4
convert input.mp4 mkv
convert input.mp4 webm
```

---

## 📁 Folder Batch Mode

```
convert -f ./folder mp3
```

---

## ❓ Help

```
convert -h
```
