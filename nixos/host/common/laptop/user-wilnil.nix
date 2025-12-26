
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wilnil = {
    isNormalUser = true;
    description = "Willard";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      ansible
      discord
      gimp
      kdePackages.kate
      kdePackages.okular
      kubectl
      kubernetes-helm
      libreoffice
      obs-studio
      qpwgraph
      signal-desktop
      slack
      tiled
      vlc
    ];
    shell = pkgs.zsh;
  };
}
