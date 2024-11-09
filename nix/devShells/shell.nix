{
  mkShell,

  zig,
}:
mkShell {
  packages = [
    zig.hook
  ];

  shellHook = ''
    export ZIG_LOCAL_CACHE_DIR="$ZIG_GLOBAL_CACHE_DIR"
  '';
}
