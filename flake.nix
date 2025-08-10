{
  description = "BeaTool Build Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import rust-overlay) ];
      };
      libPath =
        with pkgs;
        lib.makeLibraryPath [
        ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "btl-tooling-env";
        packages = (
          with pkgs;
          [
            hugo
            cargo
            rustup
          ]
        );
        shellHook = ''
          export LD_LIBRARY_PATH="${libPath}"
        '';
      };
    };
}
