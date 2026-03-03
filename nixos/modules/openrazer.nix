{ config, pkgs, lib, ... }:
{
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["wilnil"];
  environment.systemPackages = with pkgs; [
    polychromatic
    openrazer-daemon
  ];
}
