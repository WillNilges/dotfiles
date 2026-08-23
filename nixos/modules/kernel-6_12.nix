{ config, pkgs, lib, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_12; # Downgrading kernel to address sudden reboots
}
