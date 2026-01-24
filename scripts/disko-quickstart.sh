#!/bin/bash

set -euo pipefail

while getopts h: flag
do
    case "${flag}" in
        h) host=${OPTARG};;
    esac
done

if [ -z ${host+x} ]; then
    echo "Please provide a host with -h";
    exit 1
fi

# This script assumes running from live nixos usb
cd /home/nixos/dotfiles/scripts

echo "Generate hardware config"
sudo nixos-generate-config --show-hardware-config --no-filesystems > "../nixos/host/$host/hardware-configuration.nix"

echo "Partition disks"
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake "../nixos#$host" 

echo "Install NixOS"
sudo nixos-install --flake "../nixos#$host" # XXX: Not 100% sure this will work. Replace with hostname if it breaks

echo "bye bye"
