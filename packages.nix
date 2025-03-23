{ buildElvishPackage }: {
  bash-env-elvish =
    buildElvishPackage {
      domain = "github.com";
      owner = "tesujimath";
      repo = "bash-env-elvish";
      version = "0.4.5";
      hash = "sha256-DAd947IXPHfx49luD/7J4JYT6sJGPHAhy6NJGJqrHIE=";
    };
}
