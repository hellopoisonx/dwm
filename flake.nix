{
  description = "dwm";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixvim.url = "github:hellopoisonx/nixvim";
    slock.url = "github:hellopoisonx/slock";
    dmenu.url = "github:hellopoisonx/dmenu";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          self',
          inputs',
          pkgs,
          ...
        }:
        let
          lastModifiedDate = self'.lastModifiedDate or self'.lastModified or "19700101";
          version = builtins.substring 0 8 lastModifiedDate;
        in
        {
          packages.dwm =
            with pkgs;
            stdenv.mkDerivation {
              pname = "dwm";
              inherit version;

              src = ./.;
              buildInputs = [
                xorg.libX11
                xorg.libXinerama
                xorg.libXft
                xorg.libXrender
                inputs'.dmenu.packages.default
                inputs'.slock.packages.default
              ];
              nativeBuildInputs = [
                pkg-config
                makeWrapper
                inputs'.nixvim.packages.c-cpp
                bear
              ];
              preConfigure = ''
                sed -i "s@/usr/local@$out@" config.mk
                dmenu_location="${lib.getExe' inputs'.dmenu.packages.default "dmenu_run"}"
                echo "Found dmenu in $dmenu_location"
                sed -i "s@\@dmenu_run_placeholder\@@$dmenu_location@" config.def.h
                makeFlagsArray+=(
                  CC="$CC"
                  INCS="`$PKG_CONFIG --cflags fontconfig x11`"
                  LIBS="`$PKG_CONFIG --libs   fontconfig x11 xft xinerama xrender`"
                )
              '';
              buildPhase = ''
                make clean
                make all
              '';
              installPhase = ''
                make clean install
              '';
            };
          packages.default = self'.packages.dwm;
        };
    };
}
