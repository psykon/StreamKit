# OBS

This directory contains settings and profiles and scenes for OBS.

## Settings

The following differences compared to the defaults have been made:

- [X] Open stats dialogue on startup
- [X] Automatically record when streaming
- [X] Draw safe areas (EBU R 95)
- [X] Vertical Volume Controls

## Profile StreamKit-HVENC-HQ

### Streaming Encoder Settings

(Note: This assumes a OBS-Machine with quite a beefy NV GPU for a HQ Stream - Other settings for other machines will follow)

- NVENC H.264
- [X] Rescale to 1920x1080
- CBR, 6000kbps
- Keyframe Interval: 2
- Preset: Quality
- Profile: high
- [X] Look-ahead
- [X] Psycho Visual Tuning
- GPU: 0
- Max B-Frames 4 

### Recording Encoder Settings

- mkv
- CRF 19
- Interval: 1
- preset: veryfast
- Profile high

### Audio Output Settings

- All Track set to 320kbps

## Scene Collection: ShadowParty
Scene Collection for Shadow Party 2022. Scenes can be selected with the **F1-12** Keys and activated (transitioned to) with **ESC**. It contains the following scenes

### Fallback (F12)
This scene is intended to be shown when something else does not work :) 
If something is written into *C:\Users\Public\Documents\OBS_Assets\Message.txt* it will also show up in this scene (through the inclusion of the _TextSource scene).

### Slides (F1)
Scene intended to show slides from a partysystem. Edit the contained browser source to point to the URL of your partysystems Slideshow.

### Show (F2)
Shows the Output of a VLC instance on the same machine or on the same network. Edit the *VLC-NDI* Source and select the VLC instance you want to show (vlc needs to be running and it's output needs to be set to NDI)

### Browser (F5)
This is just another scene with a browser source. 

### _TextSource
This scene is intended to be included into other scenes. It will show the text content of the File *C:\Users\Public\Documents\OBS_Assets\Message.txt*. 

### _CountDown 
This scene is intended to be included into other scenes (with the "scene" source) and displays a countdown. The countdown can be controlled through the "Countdown" dock on the lower right of the UI.  




