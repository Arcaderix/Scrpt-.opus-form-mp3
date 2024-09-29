# PowerShell Script: Convert `.opus` Files to `.mp3` with Progress Bar

This PowerShell script is designed to convert all `.opus` audio files located in a source folder to `.mp3` format using FFmpeg. Once converted, the files are moved to a target folder. The script also includes a progress bar to indicate the status of the conversion process.

## Features
- **Batch Conversion**: Automatically converts all `.opus` files in a folder to `.mp3`.
- **FFmpeg Integration**: Uses FFmpeg to perform the audio conversion.
- **Progress Bar**: Provides a visual progress indicator for the conversion process.
- **Automatic Folder Creation**: If the destination folder does not exist, the script will create it.
- **Move Converted Files**: After conversion, the `.mp3` files are moved to the target folder.

## Prerequisites

### 1. Download and Install FFmpeg via PowerShell
Use PowerShell to download and install **FFmpeg**. The following steps guide you through downloading the FFmpeg executable and adding it to your system’s PATH so it can be accessed globally:

```powershell
# Download the FFmpeg zip package
Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -OutFile ffmpeg.zip

# Extract the zip package
Expand-Archive -Path ffmpeg.zip -DestinationPath .\ffmpeg

# Add FFmpeg to the system PATH
$ffmpegPath = (Get-Item ".\ffmpeg\ffmpeg-*-essentials_build\bin").FullName
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";$ffmpegPath", [System.EnvironmentVariableTarget]::Machine)

# Verify FFmpeg installation
ffmpeg -version

