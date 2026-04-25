{ config, pkgs, lib, ... }:
{
  environment.systemPackages = [
    pkgs.nodePackages."@mariozechner/pi-coding-agent"
  ];
}

