
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wilnil = {
    isNormalUser = true;
    description = "Willard";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [
      ansible
      #bambu-studio # TODO: Add maker user packages
      blender
      discord
      direnv
      easyeffects
      element-desktop
      freecad
      gcc
      gimp
      helix
      inkscape
      ironwail
      kdePackages.kate
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.okular
      kicad
      krita
      kubectl
      kubernetes-helm
      libreoffice
      mosh
      obs-studio
      pi-coding-agent
      qpwgraph
      signal-desktop
      slack
      speedcrunch
      tiled
      trilium-desktop
      vlc
      yt-dlp
      wireshark
      zed-editor
    ];
    shell = pkgs.zsh;
  };
}
