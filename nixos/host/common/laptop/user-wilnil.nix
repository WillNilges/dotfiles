
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
      freecad
      gimp
      inkscape
      kdePackages.kate
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.okular
      kicad
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
      trilium-desktop
      vlc
      wireshark
    ];
    shell = pkgs.zsh;
  };
}
