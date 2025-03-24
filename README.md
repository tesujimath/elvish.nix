# elvish.nix

This is a Nix flake which supports Elvish package management.  It is an alternative to using the [Elvish Package Manager, `epm`](https://elv.sh/ref/epm.html).

While `epm` works fine for individual users, it does not facilitate installing an Elvish script along with its package dependencies in such a way that it may be run by any user, regardless of the state of the Elvish packages they have installed with `epm`.

## Usage

The flake provides a package called `elvish` which is the same as the one in [Nixpkgs](https://github.com/NixOS/nixpkgs), but with two additional attributes, `withPackages` and `buildElvishPackage`.

To build an Elvish binary with support for certain packages, include something like this in your Nix flake:
```
          elvish-with-bash-env = elvish.withPackages (ps: with ps; [
            bash-env-elvish
          ]);
```


See the [example flake](examples/flake.nix) for the full context.

This works by setting `XDG_DATA_DIRS` in the wrapper script created by the flake which is used to invoke `elvish`.

To build a new package which is not currently in the [list of supported packages](packages.nix), use `buildElvishPackage`.
The initial list of Elvish packages was taken from [awesome-elvish](https://github.com/elves/awesome-elvish), although this author does not use many of them.

Pull requests are welcome, either version bumps or new packages.
