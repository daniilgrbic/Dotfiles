#!/bin/sh

# This builds latest Polybar. For detals, refer to
# https://github.com/polybar/polybar/wiki/Compiling

# Hard Dependencies
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

# Optional dependencies
sudo apt install -y libxcb-xkb-dev       # Keyboard layout, internal/xkeyboard
sudo apt install -y libxcb-cursor-dev    # Cursor click and scroll
sudo apt install -y libpulse-dev         # Pulseaudio controls, internal/pulseaudio
sudo apt install -y i3-wm libjsoncpp-dev # Workspaces & mode, internal/i3
sudo apt install -y libnl-genl-3-dev     # Network info, internal/network

# Building & compiling
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)

# Install polybar
sudo make install

cd ..
cd ..
