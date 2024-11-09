{
  ...
}:
{
  perSystem = { self', pkgs, ... }: {
    devShells.default = pkgs.callPackage ./shell.nix {
      nixos-cli = self'.packages.default;
    };
  };
}
