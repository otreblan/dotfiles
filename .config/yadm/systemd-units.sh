#!/usr/bin/env bash

export SYSTEMD_SERVICES=(
	NetworkManager.service
	bluetooth.service
	cpupower-gui-helper.service
	ntpd.service
	paccache.timer
	reflector.timer
)
