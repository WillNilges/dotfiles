{
  description = "Willard's sick laptop config";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, disko, nixpkgs, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.willardpad = nixpkgs.lib.nixosSystem {
      modules = [
        disko.nixosModules.disko
        ./host/willardpad
      ];
    };
    nixosConfigurations.thinkwillardthink = nixpkgs.lib.nixosSystem {
      modules = [
        disko.nixosModules.disko
        ./host/thinkwillardthink
      ];
    };
    nixosConfigurations.phoenix = nixpkgs.lib.nixosSystem {
      modules = [
        disko.nixosModules.disko
        ./host/phoenix
      ];
    };
  };
}
