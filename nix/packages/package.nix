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

  cargoHash = "sha256-+9mBOYc9mI2Z0iv4Rmr1+GiqZ1lsYwDlLR5fU4jyXWo=";

  meta = with lib; {
    homepage = "https://github.com/Frontear/nixos-cli";

    platforms = platforms.linux;
    license = lib.licenses.agpl3Plus;
    maintainers = with maintainers; [ frontear ];

    mainProgram = "nixos";
  };
}
