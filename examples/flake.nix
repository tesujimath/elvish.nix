{
  description = "Example of building and using Elvish packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    elvish = {
      url = "github:tesujimath/elvish.nix";
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

          elvish-with-bash-env = elvish.withPackages (ps: with ps; [
            bash-env-elvish
          ]);

        in
        {
          devShells =
            let
              inherit (pkgs) bashInteractive mkShell;
            in
            {
              default = mkShell { buildInputs = [ bashInteractive elvish-with-bash-env ]; };
            };

          packages.default = elvish-with-bash-env;
        }
      );
}
