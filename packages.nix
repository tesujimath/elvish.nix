{ buildElvishPackage }: {
  bash-env-elvish =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "bash-env-elvish";
      version = "0.4.5";
      hash = "sha256-DAd947IXPHfx49luD/7J4JYT6sJGPHAhy6NJGJqrHIE=";
    };

  elvish-tap =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "elvish-tap";
      version = "0.2.0";
      hash = "sha256-4M3Kh814aQ0Sv075G2q8DsKCZDFx7Hi5B0kJ7OApAPg=";
    };
}
