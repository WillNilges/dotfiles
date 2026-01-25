{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
  };
  services.fail2ban.enable = true;
}
