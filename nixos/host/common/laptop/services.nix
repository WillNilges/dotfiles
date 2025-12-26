
{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Run dynamically-linked executables "out of the box"
  # Using this for getting clangd working in neovim
  programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
  #  # Add any missing dynamic libraries for unpackaged programs
  #  # here, NOT in environment.systemPackages
  #];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    dig
    ffmpeg
    file
    go
    libgcc
    neovim
    nodejs
    podman-compose
    ripgrep
    tmux
    traceroute
    unzip
    vim
    virtualbox
    wget
    zip
  ];

  services.fwupd.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  #services.tailscale.enable = true;

  # fonts
  fonts.packages = [
    pkgs.nerd-fonts.iosevka-term
  ];

  # Enable these packages.
  programs.firefox.enable = true;
  programs.firefox.package = pkgs.librewolf;
  programs.git.enable = true;
  programs.htop.enable = true;
  programs.zsh.enable = true;

  virtualisation.podman.enable = true;
  networking.firewall.enable = true; # Just to be sure...

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
