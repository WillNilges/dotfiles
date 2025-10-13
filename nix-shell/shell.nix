{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = with pkgs.buildPackages; [
    libgcc
    python312
    cargo
    rustc
  ];
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pandas
      requests
      ninja
      matplotlib
    ]))
  ];
}
