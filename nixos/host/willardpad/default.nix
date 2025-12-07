{
    imports = [
        #./modules
        ./configuration.nix
        ./hardware-configuration.nix
        ./services.nix
        ./wilnil.nix

        ../../modules/luks-btrfs-subvolumes.nix
        ../../modules/vpn-wireguard.nix

        ../../modules/desktop-sway.nix
    ];
}
