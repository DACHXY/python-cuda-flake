{
  description = "Python Cuda";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          packageOverrides = pkgs: {
            nixpkgs.config.substituters = [
              "https://cache.nixos.org"
              "https://cuda-maintainers.cachix.org"
            ];
          };
          allowUnfree = true;
        };
      };
    in
    {
      devShell.x86_64-linux = import ./default.nix { inherit pkgs; };
    };
}
