{
  description = "dwm";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
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
          ];
          prePatch = ''
            sed -i "s@/usr/local@$out@" config.mk
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

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system}) dwm;
      });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage = forAllSystems (system: self.packages.${system}.dwm);

      nixosModules.dwm =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [ self.overlay ];

          environment.systemPackages = [ pkgs.dwm ];
        };
    };
}
