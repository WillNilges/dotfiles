{inputs, ...}: {
  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  disable-openblas-tests = final: prev: {
    openblas =
      if prev.stdenv.hostPlatform.system == "i686-linux"
      then prev.openblas.overrideAttrs (_: {doCheck = false;})
      else prev.openblas;
  };
}
