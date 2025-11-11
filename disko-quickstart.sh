#!/bin/bash

set -euo pipefail

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./nixos-post-disko/luks-btrfs-subvolumes.nix

mount | grep /mnt

echo "Look good? Press enter to continue."
read good

sudo nixos-generate-config --no-filesystems --root /mnt

echo "Look good? Press enter to continue."
read good

sudo rm /mnt/etc/nixos/*
sudo cp ./nixos-post-disko/* /mnt/etc/nixos/

sudo nixos-install

echo "bye bye"
