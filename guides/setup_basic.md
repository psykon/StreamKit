# Basic Stream Setup with OBS, VLC and NDI

This guide contains the steps needed to get what I would describe as a "basic streaming setup with a focus on non-live content". Its about setting up OBS, OBS Plugins, and to stream video and audio from VLC to OBS via NDI.  

## OBS Portable installation

You could simply install OBS the usual way, but I recommend to create a portable OBS installation, so that all your settings and plugins are in one place (and thus easy to backup/transfer).

- Get the latest x64 release of OBS from https://github.com/obsproject/obs-studio/releases. Download the zip release, not the installer.
- Extract the archive at a location of your choice
- Create a file called 'portable_mode.txt' in the same location that you extracted the archive (the file should be next to the bin, data and obs-plugins dirs)
- Start OBS (located at /bin/x64/obs64.exe). Click through the welcome dialog (settings dont matter right now). This should create a "config" dir in the obs main directory (where your portable_mode.txt file is)
- You now have a portable obs installation!
- Download the latest release of the obs-ndi plugin: https://github.com/Palakis/obs-ndi/releases (again, go for the zip, not the installer)
- Extract the content of the archive to the same location as you have extracted the obs archive.
- Start OBS. If a windows firewall dialog opens - allow it. You should see the "NDI Output settings" under tools and the "NDI Source" in your sources.

## VLC and NDI

Sadly, I have not yet worked out an (non-hackish) way to get a portable VLC instance with the NDI Plugin. Therefore, this part will modify any existing vlc installation you may have on that machine/ :(

- Download and install VLC: https://www.videolan.org/vlc/
- Download NDI Tools from https://ndi.tv/tools/ this includes the VLC Plugin.
- Install NDI Tools with default settings.
- Start VLC and change the following Settings (Tools -> Preferences):
  - Audio -> Output Module -> Set to "NDI audio output" 
  - Video -> Output -> Set to "NDI video output"
- Restart VLC


## NDI Setup

- Play a video in VLC. You will get a black screen and no audio - this is expected.
- In OBS, add a new "NDI Source", give it a name (for example, "VLC Player")
- In the Properties Panel for the new Source, click in the dropdown button for the "Source Name". You should see something like "$hostname (VLC)". This is the NDI Stream from the VLC instance running on this machine. Select it. You can leave the other settings as default for now. But you may want to activate hardware acceleration (test this).
- You should see the video playing in VLC in your OBS output. Rejoice! 

