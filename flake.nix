{
  description = "Hardware City organization website";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        buildDeps = with pkgs; [ git hugo dart-sass nodejs gnumake pnpm];
        devDeps = with pkgs;
          buildDeps ++ [
          ];
      in
      { devShell = pkgs.mkShell { buildInputs = devDeps; }; }
    );

}
