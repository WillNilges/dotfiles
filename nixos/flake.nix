{
  description = "Willard's sick laptop config";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, disko, nixpkgs, ... }@inputs: let
    inherit (self) outputs;
  in rec {
    overlays = import ./overlays {inherit inputs;};

    # Please replace my-nixos with your hostname
    nixosConfigurations.willardpad = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit outputs;};
      modules = [
        disko.nixosModules.disko
        ./host/willardpad
      ];
    };
    nixosConfigurations.thinkwillardthink = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit outputs;};
      modules = [
        disko.nixosModules.disko
        ./host/thinkwillardthink
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
