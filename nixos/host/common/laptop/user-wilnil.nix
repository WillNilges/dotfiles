
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
      btop
      discord
      direnv
      chirp
      easyeffects
      # element-desktop
      freecad
      gcc
      gh
      gimp
      gnucash
      helix
      inkscape
      ironwail
      jq
      kdePackages.kate
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.okular
      # kicad # TODO: Add maker user packages (kicad is fucking huge)
      krita
      kubectl
      kubernetes-helm
      libreoffice
      mesa-demos
      mosh
      opencode
      unstable.pi-coding-agent
      qpwgraph
      signal-desktop
      slack
      sshfs
      terraform
      speedcrunch
      tiled
      trilium-desktop
      vault
      vlc
      yt-dlp
      wireshark
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
