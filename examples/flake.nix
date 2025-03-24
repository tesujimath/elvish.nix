{
  description = "Example of building and using Elvish packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    elvish = {
      url = "./..";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
          };

          elvish = inputs.elvish.packages.${system}.default;

          elvish-full = elvish.withPackages (ps: with ps; [
            bash-env-elvish
          ]);

        in
        {
          devShells =
            let
              inherit (pkgs) bashInteractive mkShell;
            in
            {
              default = mkShell { buildInputs = [ bashInteractive elvish-full ]; };
            };

          packages.default = elvish-full;
        }
      );
}
