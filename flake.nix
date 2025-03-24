{
  description = "Elvish packages and builder";

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
                inherit (attrs) domain owner repo version hash;
                pname = attrs.repo;
                fetchSubmodules = if attrs ? fetchSubmodules then attrs.fetchSubmodules else false;

                dontConfigure = true;
                dontBuild = true;

                src = (fetchers."${domain}")
                  {
                    owner = owner;
                    repo = repo;
                    rev = version;
                    hash = hash;
                    inherit fetchSubmodules;
                  };

                installPhase = ''
                  mkdir -p $out/share/elvish/lib/$domain/$owner/$repo
                  cp -a $src/* $out/share/elvish/lib/$domain/$owner/$repo
                '';
              } // attrs;

          all-elvish-packages = import ./packages.nix { inherit buildElvishPackage; };

          withPackages =
            let inherit (pkgs) lib stdenv makeWrapper;
              inherit (lib) makeSearchPath;
              inherit (stdenv) mkDerivation;
            in
            select-ps: mkDerivation
              {
                name = "elvish-with-packages";

                dontUnpack = true;
                dontConfigure = true;
                dontBuild = true;

                nativeBuildInputs = [
                  makeWrapper
                ];

                installPhase = ''
                  mkdir -p $out/bin
                  cp -a "${vanilla-elvish}/bin/elvish" $out/bin/elvish
                '';

                fixupPhase = ''
                  wrapProgram $out/bin/elvish --prefix XDG_DATA_DIRS : "${makeSearchPath "share" (map (p: "${p}") (select-ps all-elvish-packages))}"
                '';
              };


          elvish-with-all-packages = withPackages (ps: pkgs.lib.attrsets.attrValues ps);

          elvish = vanilla-elvish // { inherit buildElvishPackage withPackages; };

        in
        {
          devShells =
            let
              inherit (pkgs) bashInteractive mkShell;
            in
            {
              default = mkShell { buildInputs = [ bashInteractive ]; };
            };

          packages = {
            default = elvish;

            inherit elvish-with-all-packages;
          };
        }
      );
}
