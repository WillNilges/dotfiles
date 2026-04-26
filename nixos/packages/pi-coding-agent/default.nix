{
  lib,
  stdenv,
  fetchurl,
  installShellFiles,
}:

let
  version = "0.70.2";
  pname = "pi-coding-agent";

  sources = {
    x86_64-linux = fetchurl {
      url = "https://github.com/badlogic/pi-mono/releases/download/v${version}/pi-linux-x64.tar.gz";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    aarch64-linux = fetchurl {
      url = "https://github.com/badlogic/pi-mono/releases/download/v${version}/pi-linux-arm64.tar.gz";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    x86_64-darwin = fetchurl {
      url = "https://github.com/badlogic/pi-mono/releases/download/v${version}/pi-darwin-x64.tar.gz";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    aarch64-darwin = fetchurl {
      url = "https://github.com/badlogic/pi-mono/releases/download/v${version}/pi-darwin-arm64.tar.gz";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  };
in
stdenv.mkDerivation {
  inherit pname version;

  src = sources.${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m 755 pi $out/bin/pi
    runHook postInstall
  '';

  meta = {
    description = "Pi is a minimal terminal coding harness. Adapt pi to your workflows, not the other way around. Extend it with TypeScript extensions, skills, prompt templates, and themes. Bundle them as pi packages and share via npm or git.";
    homepage = "https://pi.dev";
    license = lib.licenses.mit;
    mainProgram = "pi";
    maintainers = [ lib.maintainers.willnilges ];
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  };
}
