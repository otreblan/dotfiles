#!/usr/bin/env bash

export SYSTEMD_UNITS=(
	NetworkManager.service
	bluetooth.service
	cpupower-gui-helper.service
	cups.service
	ntpd.service
	paccache.timer
	reflector.timer
	sshd.service
)

export SYSTEMD_USER_UNITS=(
	tracker-miner-fs-3.service
)
