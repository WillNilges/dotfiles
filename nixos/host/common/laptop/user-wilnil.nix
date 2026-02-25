
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wilnil = {
    isNormalUser = true;
    description = "Willard";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [
      ansible
      blender
      discord
      direnv
      easyeffects
      element-desktop
      gimp
      inkscape
      kdePackages.kate
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.okular
      krita
      kubectl
      kubernetes-helm
      libreoffice
      gcc
      mosh
      obs-studio
      qpwgraph
      signal-desktop
      slack
      speedcrunch
      tiled
      vlc
      wireshark
    ];
    shell = pkgs.zsh;
  };
}
