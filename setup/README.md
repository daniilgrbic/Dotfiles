# Setting up the system

I have used a clean install of Debian 12 with the Cinnamon DE as the base for my setup - this way I didn't have to worry about some aspects such as WiFi, Bluetooth, audio, and mounting external drives.

The text below explains what changes I've made to the system and provides a guide on how to setup something like this on your own.

## Basic development tools
- 

## Core packages

Essential packages include the WM itself with all of the additional components, but also some system management utils:
- `i3-wm` - the i3 window manager itself
- `i3lock` - basic lockscreen compatible with i3
- `rofi` - "window switcher, application launcher and dmenu replacement"
- `feh` - a cli tool for setting the wallpaper

The following packages are not needed on a desktop system, but are important if you (like me) have a laptop:
- `brightnessctl` - control your laptop screen brightness
- `xinput` - probably a powerful tool, I only use it to enable the touchpad
- `tlp` - power saving, very effective at prolonging battery life when unplugged

Nice-haves iclude non-essential tools and packages that make the system just a bit prettier:  
- `playerctl` - a tool for controlling media playback, used by a custom Polybar widget
- `terminator` and `picom` - a good terminal that supports transparent background, and a compositor to enable transparency in the first place 

## Browser (and Flatpak)

The `firefox-esr` package provided in Debian 12 is very old and some things don't work properly using this version of Firefox. Since the browser is probably the highest risc component of any given modern OS, I prefer to use regulary updated Flatpak version.
