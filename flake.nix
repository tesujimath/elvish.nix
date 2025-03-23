{
  description = "Elvish epm packages and support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          vanilla-elvish = pkgs.elvish;

          buildElvishPackage =
            let inherit (pkgs) fetchFromBitBucket fetchFromGitHub fetchFromGitLab stdenv;
              inherit (stdenv) mkDerivation;
            in
            attrs:
            let
              inherit (attrs) domain;

              fetchers =
                {
                  "github.com" = fetchFromGitHub;
                  "gitlab.com" = fetchFromGitLab;
                  "bitbucket.org" = fetchFromBitBucket;
                };
            in
            mkDerivation
              rec {
                inherit (attrs) owner repo version hash;
                pname = attrs.repo;

                dontConfigure = true;
                dontBuild = true;

                src = (fetchers."${domain}")
                  {
                    owner = owner;
                    repo = repo;
                    rev = version;
                    hash = hash;
                  };

                installPhase = ''
                  mkdir -p $out/elvish/lib/$domain/$owner/$repo
                  cp -a $src/* $out/elvish/lib/$domain/$owner/$repo
                '';
              } // attrs;

          packages = import ./packages.nix { inherit buildElvishPackage; };
        in
        {
          devShells =
            let
              inherit (pkgs) bashInteractive mkShell;
            in
            {
              default = mkShell { buildInputs = [ bashInteractive ]; };
            };

          packages = packages;
        }
      );
}




