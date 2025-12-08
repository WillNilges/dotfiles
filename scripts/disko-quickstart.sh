#!/bin/bash

set -euo pipefail

while getopts h: flag
do
    case "${flag}" in
        h) host=${OPTARG};;
    esac
done

if [ -z ${host+x} ]; then
    echo "Please provide a host";
    exit 1
fi

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./nixos/luks-btrfs-subvolumes.nix

mount | grep /mnt

echo "Look good? Press enter to continue."
read good

sudo nixos-generate-config --no-filesystems --root /mnt

echo "Look good? Press enter to continue."
read good

cp /mnt/etc/nixos/hardware-configuration.nix ./nixos
sudo nixos-install --flake "../nixos#$host" # XXX: Not 100% sure this will work. Replace with hostname if it breaks

echo "bye bye"
