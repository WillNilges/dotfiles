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

  npmDepsHash = "";
  npmRoot = "packages/coding-agent";

  # The prepack script runs the build script, which we'd rather do in the build phase.
  npmPackFlags = [ "--ignore-scripts" ];

  NODE_OPTIONS = "--openssl-legacy-provider";

  meta = {
    description = "Pi is a minimal terminal coding harness. Adapt pi to your workflows, not the other way around. Extend it with TypeScript extensions, skills, prompt templates, and themes. Bundle them as pi packages and share via npm or git.";
    homepage = "https://pi.dev";
    license = lib.licenses.mit;
    mainProgram = "pi";
    maintainers = with lib.maintainers; [ willnilges ];
  };
})
