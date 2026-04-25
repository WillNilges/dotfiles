{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    nodePackages.pi-coding-agent
  ];
}

