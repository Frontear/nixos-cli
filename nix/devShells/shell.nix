{
  mkShell,

  nixos-cli,
}:
mkShell {
  inputsFrom = [
    nixos-cli
  ];
}
