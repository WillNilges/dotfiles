{ config, pkgs, lib, ... }:
{
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
