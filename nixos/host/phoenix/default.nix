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
        ../../modules/openrazer.nix
        ../../modules/steam.nix
        ../../modules/opencode.nix
        ../../modules/ssh-server.nix
    ];

    networking.hostName = "phoenix"; # Define your hostname.
    wilnil.system.primaryDrive = "/dev/sda";
}
