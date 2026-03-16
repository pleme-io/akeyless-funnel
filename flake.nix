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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "library";
    pname = "akeyless-funnel";
    vendorHash = "sha256-G2LRS+rzTDo1z/yV9CKW8sz1Bs6GPIGPw3K8O76PjsA=";
    description = "Go library for unification of identical operations such as API requests";
    homepage = "https://github.com/pleme-io/akeyless-funnel";
  };
}
