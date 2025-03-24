# Complete list of packages from [awesome-elvish](https://github.com/elves/awesome-elvish).
#
# Packages whose repositories have distinguishable names are named after the bare repo.
# Otherwise the owner is used as a prefix.

# Inclusion here does not imply fitness for purpose or even that the packages work.
# If breakage is discovered, packages which aren't fixed in reasonble time are likely to be removed.

{ buildElvishPackage }:
{
  # packages with recognizable names

  bash-env-elvish =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "bash-env-elvish";
      version = "0.5.0";
      hash = "sha256-tsXwsxkSRCzmPspCnV6Y1O/ZugML6npGGvYzlYoF5+g=";
    };

  direlv =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "direlv";
      version = "0.1.0";
      hash = "sha256-21x5QxjAAYNd94nLVwWH4tYmmyheVVt+2Y/VJvMSMTU=";
    };

  elvish-gitstatus =
    buildElvishPackage {
      domain = "github.com";
      owner = "href";
      repo = "elvish-gitstatus";
      version = "23888d94dab69f1f4b92a71fceb804d0762e7d9a";
      hash = "sha256-c3cNS3+h7oc7mg8mx+Z4ZEjfTXMEqxjtP+1eUGQ577I=";
    };

  elvish-tap =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "elvish-tap";
      version = "0.2.0";
      hash = "sha256-4M3Kh814aQ0Sv075G2q8DsKCZDFx7Hi5B0kJ7OApAPg=";
    };

  rivendell =
    buildElvishPackage {
      domain = "github.com";
      owner = "crinklywrappr";
      repo = "rivendell";
      version = "60db95773cc8cce96ce4e3eed48ae628c434c4f5";
      hash = "sha256-yN5Hq+tzxQ+yQYOCuku0W80ffmytGB8inlW2owxo91w=";
    };

  sindarin-term =
    buildElvishPackage {
      domain = "github.com";
      owner = "jkbr-19";
      repo = "sindarin-term";
      version = "a7df41d317291d1aa3cdff77377410350eb12f89";
      hash = "sha256-/TAOGqnumd84ODgMYfcKSTBV8rStBgNyNwkEJdVHbC0=";
    };

  # packages with otherwise ambiguous names require owner as a prefix

  aca-elvish-bash-completion =
    buildElvishPackage {
      domain = "github.com";
      owner = "aca";
      repo = "elvish-bash-completion";
      version = "b6c8024a2a0d7105ecd300121d5d666d37563b4b";
      hash = "sha256-USMmQ3mvo3oc+xua8Ew9smGTGuW2cae9SXRWcNEqIDA=";
      fetchSubmodules = true;
    };

  gergelyk-elvish-libs =
    buildElvishPackage {
      domain = "github.com";
      owner = "gergelyk";
      repo = "elvish-libs";
      version = "01806ca97d5ff90bf9724edf6706519be5f2ee10";
      hash = "sha256-ac7Nr3KiHbAMiOIPlfu+nsmoR5a6aPtcowfe5VjUXC4=";
    };

  iandol-elvish-modules =
    buildElvishPackage {
      domain = "github.com";
      owner = "iandol";
      repo = "elvish-modules";
      version = "dfaab90e12d5f44d40ada3e755dd6a8c0c5846b2";
      hash = "sha256-rjj6MUx9evxVKfXlGbMzjoEZBzjnXOoY2fjeFaUG1lY=";
    };

  iwoloschin-elvish-packages =
    buildElvishPackage {
      domain = "github.com";
      owner = "iwoloschin";
      repo = "elvish-packages";
      version = "4e38d2cc8882e3bf03b13478754094a052e5c30c";
      hash = "sha256-1MVyCCcUXTiNia0WbDFZX6i4BdJlH2n+92W6wPUCUW8=";
    };

  kolbycrouch-elvish-libs =
    buildElvishPackage {
      domain = "github.com";
      owner = "kolbycrouch";
      repo = "elvish-libs";
      version = "12c8b18fb64ac4d55510b6be8ef576789fbe0ad5";
      hash = "sha256-C135Qwj/zmzj7WObRVQTW/1G0da+AMcGKPEXe6wNRfc=";
    };

  krader1961-elvish-lib =
    buildElvishPackage {
      domain = "github.com";
      owner = "krader1961";
      repo = "elvish-lib";
      version = "1772e4aa900b5f9ec615f89ccd2d98e3f3452204";
      hash = "sha256-un5tH6hQK1VigbZtRi4FzQ4XuUJZuVr3IsiTWoKYG2M=";
    };

  muesli-elvish-libs =
    buildElvishPackage {
      domain = "github.com";
      owner = "muesli";
      repo = "elvish-libs";
      version = "bfdc441990d95eec02489e071418a8718f3e3794";
      hash = "sha256-vmSDGkH2WRfvDLfnHXtI1tE94cGd+hzFPOib82Gs85U=";
    };

  xiaq-edit =
    buildElvishPackage {
      domain = "github.com";
      owner = "xiaq";
      repo = "edit.elv";
      version = "2431c94273e9bfc2f48f78f1ee2fddb204b33864";
      hash = "sha256-x4CldU69uq4ajmUMXQq/TRwsGHZLdeZPQDq4v2zQ6gE=";
    };

  zzamboni-elvish-completions =
    buildElvishPackage {
      domain = "github.com";
      owner = "zzamboni";
      repo = "elvish-completions";
      version = "b5b4b0053888327bc5032a188b0e145296e17071";
      hash = "sha256-m1/kjUkR06AW6886GwQZ2esL9Iis9itHLCRBI9J3kaU=";
    };

  zzamboni-elvish-modules =
    buildElvishPackage {
      domain = "github.com";
      owner = "zzamboni";
      repo = "elvish-modules";
      version = "41796e6dc6015a4b25c639eeb8a6519c1f7f97ee";
      hash = "sha256-tA6wes6MFoapN94+hu2Qv//B5iVCH1Ga2affD5OmPgU=";
    };

  zzamboni-elvish-themes =
    buildElvishPackage {
      domain = "github.com";
      owner = "zzamboni";
      repo = "elvish-themes";
      version = "3c93236951783a7118478d152b5db7124eb465bc";
      hash = "sha256-uJswpp3Pi4DMDqUhK9uJefRpYVy43L4Zm9AN7tH+CJs=";
    };
}
