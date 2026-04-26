{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage (finalAttrs: {
  pname = "pi-coding-agent";
  version = "0.70.2";
  src = fetchFromGitHub {
    owner = "badlogic";
    repo = "pi-mono";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-qqmJloTp3mWuZBGgpwoyoFyXx6QD8xhJEwCZb7xFabM=";
  };

  npmDepsHash = "sha256-ImDvTC0Nm+IGYJuqjwUUfnOtA65uJvjlpP4h2Xt/2vE=";

  # The npm package is pre-built, no need to run build
  dontNpmBuild = true;

  # Pack from the specific package directory in the monorepo
  installPhase = ''
    runHook preInstall
    cd packages/coding-agent
    npm pack --ignore-scripts
    npm install -g --prefix $out *.tgz
    runHook postInstall
  '';

  meta = {
    description = "Pi is a minimal terminal coding harness. Adapt pi to your workflows, not the other way around. Extend it with TypeScript extensions, skills, prompt templates, and themes. Bundle them as pi packages and share via npm or git.";
    homepage = "https://pi.dev";
    license = lib.licenses.mit;
    mainProgram = "pi";
    maintainers = with lib.maintainers; [ willnilges ];
  };
})
