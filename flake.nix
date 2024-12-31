{
  description = "dwm";

  # Nixpkgs / NixOS version to use.
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixvim.url = "github:hellopoisonx/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
    let

      # to work with older version of flakes
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

      # Generate a user-friendly version number.
      version = builtins.substring 0 8 lastModifiedDate;

      # System types to support.
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        }
      );
    in
    {

      # A Nixpkgs overlay.
      overlay = final: prev: {
        dwm = final.stdenv.mkDerivation {
          pname = "dwm";
          inherit version;

          src = ./.;
          buildInputs = with final; [
            xorg.libX11
            xorg.libXinerama
            xorg.libXft
            xorg.libXrender
          ];
          nativeBuildInputs = with final; [
            pkg-config
            makeWrapper
            nixvim.packages.${final.system}.c-cpp
            bear
          ];
          preConfigure = ''
            sed -i "s@/usr/local@$out@" config.mk
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

      };

      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system}) dwm;
      });
      defaultPackage = forAllSystems (system: self.packages.${system}.dwm);
    };
}
