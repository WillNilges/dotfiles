{
  description = "Willard's sick laptop config";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, disko, nixpkgs, ... }@inputs: {
    # To make a new machine,
    # Please replace my-nixos with your hostname
    # nixosConfigurations.willardpad = nixpkgs.lib.nixosSystem {};
    nixosConfigurations.willardpad = nixpkgs.lib.nixosSystem {
      modules = [
        disko.nixosModules.disko
        ./configuration.nix
        ./hardware-configs/framework13.nix
        ./luks-btrfs-subvolumes.nix
        ./desktop-sway.nix
        ./vpn-wireguard.nix
      ];
    };
  };
}
