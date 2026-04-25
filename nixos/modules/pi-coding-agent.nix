{ config, pkgs, lib, ... }:

let
  # Use node2nix or a simpler approach with mkDerivation
  # Since buildNpmPackage requires a lockfile and this is an npm tarball,
  # we'll use a more straightforward approach with stdenv
  pi-coding-agent = pkgs.stdenv.mkDerivation rec {
    pname = "pi-coding-agent";
    version = "0.70.2";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-${version}.tgz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    # The package unpacks to package/
    sourceRoot = "package";

    nativeBuildInputs = [ pkgs.nodejs_22 ];

    # Install dependencies and build
    buildPhase = ''
      export HOME=$TMPDIR
      npm install --omit=dev --ignore-scripts
      npm run build --if-present
    '';

    installPhase = ''
      mkdir -p $out/lib/node_modules/@mariozechner/pi-coding-agent
      cp -r . $out/lib/node_modules/@mariozechner/pi-coding-agent/

      mkdir -p $out/bin
      ln -s $out/lib/node_modules/@mariozechner/pi-coding-agent/dist/cli.js $out/bin/pi
    '';

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
