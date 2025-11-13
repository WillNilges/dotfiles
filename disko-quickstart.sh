#!/bin/bash

set -euo pipefail

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./nixos/luks-btrfs-subvolumes.nix

mount | grep /mnt

echo "Look good? Press enter to continue."
read good

sudo nixos-generate-config --no-filesystems --root /mnt

echo "Look good? Press enter to continue."
read good

cp /mnt/etc/nixos/hardware-configuration.nix ./nixos
sudo nixos-install --flake ./nixos#willardpad

echo "bye bye"
