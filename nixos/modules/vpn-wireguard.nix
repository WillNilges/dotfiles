{ config, pkgs, lib, ... }:
{
  # environment.systemPackages = with pkgs; [];
  networking.wg-quick.interfaces.nycmesh0.configFile = "/etc/nixos/files/wireguard/nycmesh0.conf";
  #networking.wg-quick.interfaces.wgal0.configFile = "/etc/nixos/files/wireguard/wgal0.conf";
  networking.wg-quick.interfaces.gal_pub0.configFile = "/etc/nixos/files/wireguard/gal_pub0.conf";
}
