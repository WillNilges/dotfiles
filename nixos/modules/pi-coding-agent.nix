{ config, pkgs, lib, ... }:

let
  pi-coding-agent = pkgs.buildNpmPackage {
    pname = "pi-coding-agent";
    version = "0.70.2";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-0.70.2.tgz";
      hash = lib.fakeHash;
    };

    npmDepsHash = lib.fakeHash;

    # Package is already built in the tarball
    dontNpmBuild = true;

    installPhase = ''
      runHook preInstall
      
      mkdir -p $out/lib/node_modules/@mariozechner/pi-coding-agent
      cp -r . $out/lib/node_modules/@mariozechner/pi-coding-agent/
      
      mkdir -p $out/bin
      ln -s $out/lib/node_modules/@mariozechner/pi-coding-agent/dist/cli.js $out/bin/pi
      
      runHook postInstall
    '';

    meta = with lib; {
      description = "CLI coding agent harness";
      homepage = "https://github.com/MarioZechner/pi-coding-agent";
      license = licenses.mit;
      mainProgram = "pi";
    };
  };
in
{
  environment.systemPackages = [
    pi-coding-agent
  ];
}
