{
  description = "Go library for unification of identical operations such as API requests";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoLibraryCheck = (import "${substrate}/lib/go-library-check.nix").mkGoLibraryCheck;
    in {
      checks.default = mkGoLibraryCheck pkgs {
        pname = "akeyless-funnel";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-G2LRS+rzTDo1z/yV9CKW8sz1Bs6GPIGPw3K8O76PjsA=";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
