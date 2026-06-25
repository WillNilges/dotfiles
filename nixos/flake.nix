{
  description = "Willard's sick laptop config";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    #dolphin-overlay.url = "github:rumboon/dolphin-overlay"; # https://github.com/rumboon/dolphin-overlay/pull/4
    dolphin-overlay.url = "github:FUFSoB/dolphin-overlay"; # Waiting on above PR to be merged

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, disko, nixpkgs, dolphin-overlay, ... }@inputs: let
    inherit (self) outputs;
  in rec {
    overlays = import ./overlays {inherit inputs;};

    # Please replace my-nixos with your hostname
    nixosConfigurations.willardpad = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit outputs;};
      modules = [
        disko.nixosModules.disko
        ./host/willardpad
        {
          nixpkgs.overlays = [ dolphin-overlay.overlays.default ];
        }
      ];
    };
    nixosConfigurations.thinkwillardthink = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit outputs;};
      modules = [
        disko.nixosModules.disko
        ./host/thinkwillardthink
        {
          nixpkgs.overlays = [ dolphin-overlay.overlays.default ];
        }
      ];
    };
    nixosConfigurations.phoenix = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit outputs;};
      modules = [
        disko.nixosModules.disko
        ./host/phoenix
      ];
    };
  };
}
