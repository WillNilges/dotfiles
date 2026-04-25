{ config, pkgs, lib, ... }:

let
  pi-coding-agent = pkgs.buildNpmPackage rec {
    pname = "pi-coding-agent";
    version = "1.0.0";

    src = pkgs.fetchNpmPackage {
      name = "@mariozechner/pi-coding-agent";
      version = "latest";
    };

    npmDepsHash = lib.fakeHash;

    buildPhase = ''
      npm run build
    '';

    installPhase = ''
      mkdir -p $out/bin
      npm install -g --prefix $out .
    '';
  };
in
{
  environment.systemPackages = [
    pi-coding-agent
  ];
}
