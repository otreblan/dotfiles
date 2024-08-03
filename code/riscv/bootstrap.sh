#!/usr/bin/env bash

#https://riscv.mirror.pkgbuild.com/images/archriscv-latest.tar.zst

CHROOT_DIR="archriscv2"

sudo pacman -S --needed qemu-user-static qemu-user-static-binfmt
curl -OC - https://riscv.mirror.pkgbuild.com/images/archriscv-latest.tar.zst

mkdir -p "$CHROOT_DIR"
sudo bsdtar -xf archriscv-latest.tar.zst -C "$CHROOT_DIR"
