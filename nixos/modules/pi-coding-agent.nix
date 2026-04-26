{ config, pkgs, lib, ... }:

let
  pi-coding-agent = pkgs.stdenv.mkDerivation {
    pname = "pi-coding-agent";
    version = "0.70.2";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-0.70.2.tgz";
      hash = lib.fakeHash;
    };

    nativeBuildInputs = [ pkgs.nodejs pkgs.makeWrapper ];

    installPhase = ''
      runHook preInstall
      
      # Create a temp package dir and install dependencies
      export HOME=$TMPDIR
      npm install --ignore-scripts --production
      
      # Install to output
      mkdir -p $out/lib/node_modules/@mariozechner/pi-coding-agent
      cp -r . $out/lib/node_modules/@mariozechner/pi-coding-agent/
      
      mkdir -p $out/bin
      makeWrapper ${pkgs.nodejs}/bin/node $out/bin/pi \
        --add-flags $out/lib/node_modules/@mariozechner/pi-coding-agent/dist/cli.js
      
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
