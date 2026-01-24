{
    imports = [
        #./modules
        ./hardware-configuration.nix

        ../common/laptop/configuration.nix
        ../common/laptop/services.nix
        ../common/laptop/user-wilnil.nix

        ../../modules/luks-btrfs-subvolumes.nix

        ../../modules/desktop-sway.nix
        ../../modules/driver-nvidia.nix
        ../../modules/steam.nix
    ];

    networking.hostName = "phoenix"; # Define your hostname.
    wilnil.system.primaryDrive = "/dev/sda";
}
