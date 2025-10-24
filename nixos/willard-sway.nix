{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    mako # notification system developed by swaywm maintainer
    networkmanagerapplet
    slurp # screenshot functionality
    swayidle
    swaylock
    waybar
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  ];


  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;
  services.blueman.enable = true;
}
