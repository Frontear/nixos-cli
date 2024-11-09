{
  lib,
  rustPlatform,
}:
rustPlatform.buildRustPackage {
  pname = "nixos-cli";
  version = "0.1.0";

  src = with lib.fileset; toSource {
    root = ../../.;
    fileset = unions [
      ../../src
      ../../Cargo.toml
      ../../Cargo.lock
    ];
  };

  cargoLock.lockFile = ../../Cargo.lock;

  meta = with lib; {
    homepage = "https://github.com/Frontear/nixos-cli";

    platforms = platforms.linux;
    license = lib.licenses.agpl3Plus;
    maintainers = with maintainers; [ frontear ];

    mainProgram = "nixos";
  };
}
