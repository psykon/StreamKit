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

