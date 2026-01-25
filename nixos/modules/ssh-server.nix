{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  services.fail2ban.enable = true;
}
