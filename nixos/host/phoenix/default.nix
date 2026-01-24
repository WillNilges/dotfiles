{
    imports = [
        #./modules
        ./hardware-configuration.nix

        ../common/laptop/configuration.nix
        ../common/laptop/services.nix
        ../common/laptop/user-wilnil.nix

        ../../modules/luks-btrfs-subvolumes.nix

        ../../modules/desktop-sway.nix
    ];

    networking.hostName = "willardpad"; # Define your hostname.
    wilnil.system.primaryDrive = "/dev/sda";
}
