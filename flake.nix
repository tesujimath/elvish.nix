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
                  mkdir -p $out/share/elvish/lib/$domain/$owner/$repo
                  cp -a $src/* $out/share/elvish/lib/$domain/$owner/$repo
                '';
              } // attrs;

          withPackages =
            let inherit (pkgs) lib stdenv makeWrapper;
              inherit (lib) makeSearchPath;
              inherit (stdenv) mkDerivation;
            in
            ps: mkDerivation
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
                  wrapProgram $out/bin/elvish --prefix XDG_DATA_DIRS : "${makeSearchPath "share" (map (p: "${p}") ps)}"
                '';
              };


          all-elvish-packages = import ./packages.nix { inherit buildElvishPackage; };
          bash-env-elvish = all-elvish-packages.bash-env-elvish;
          elvish-tap = all-elvish-packages.elvish-tap;

          elvish-full = withPackages [ bash-env-elvish elvish-tap ];
        in
        {
          devShells =
            let
              inherit (pkgs) bashInteractive lib mkShell;
            in
            {
              default = mkShell { buildInputs = [ bashInteractive ]; };
            };

          # all-elvish-packages = (map (p: "${p."${system}"}") (pkgs.lib.attrVals all-elvish-packages));
          inherit all-elvish-packages bash-env-elvish;

          packages = all-elvish-packages // {
            default = vanilla-elvish;

            inherit elvish-full;
          };
        }
      );
}
