#!/usr/bin/env bash

grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')"
