{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix/fix-214";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      treefmtCfg = (treefmt-nix.lib.evalModule pkgs ./treefmt.nix).config.build;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          treefmtCfg.wrapper
          (pkgs.lib.attrValues treefmtCfg.programs)
        ];
      };
      formatter.${system} = treefmtCfg.wrapper;
    };
}
