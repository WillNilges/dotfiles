{ config, pkgs, lib, ... }:

let
  pi-coding-agent = pkgs.buildNpmPackage rec {
    pname = "@mariozechner/pi-coding-agent";
    version = "0.70.2";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-${version}.tgz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    # The package unpacks to package/, so we need to handle that
    postUnpack = ''
      mv $sourceRoot/package/* $sourceRoot/
      rmdir $sourceRoot/package
    '';

    # Node.js version requirement: >=20.6.0
    nodejs = pkgs.nodejs_22;

    meta = with lib; {
      description = "A coding agent harness that helps users by reading files, executing commands, editing code, and writing new files";
      homepage = "https://github.com/badlogic/pi-mono";
      license = licenses.asl20;
      mainProgram = "pi";
      platforms = platforms.unix;
    };
  };
in
{
  environment.systemPackages = [
    pi-coding-agent
  ];
}
