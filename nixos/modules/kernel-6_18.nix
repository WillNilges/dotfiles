{ config, pkgs, lib, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_18; # Downgrading kernel to address sudden reboots
}
