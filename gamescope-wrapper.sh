#!/bin/sh

LD_PRELOAD="" exec gamescope -w 2560 -h 1440 -r 180 --expose-wayland --fullscreen --adaptive-sync -- env LD_PRELOAD="$LD_PRELOAD" "$@"
