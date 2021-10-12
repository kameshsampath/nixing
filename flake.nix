{
  description = "Kameshs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, home-manager, nixpkgs, darwin, ... }:

    {
      # Build darwin flake using:
      # darwin-rebuild build --flake .
      darwinConfigurations."skmacsolo" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [ ./skmacsolo.nix ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."skmacsolo".pkgs;

      # Executed by `nix build .#<name>`
      # packages."x86_64-darwin"."kameshsampath" = import ./pkgs;
      # packages."x86_64-linux"."kameshsampath" = import ./pkgs;
      # Default overlay, for use in dependent flakes
      # overlays = {
      #  kameshsampath = import ../pkgs { inherit (self) pkgs; };
      # };

      # Home manager configurations
      homeConfigurations = {
        kameshs = home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, lib, ... }: {
            imports = [ ./systems/mac/kameshs.nix ];
            nixpkgs = {
              overlays = [ ./overlays/my-packages.nix ];
              config = { allowUnfree = true; };
            };
          };
          system = "x86_64-darwin";
          stateVersion = "21.11";
          homeDirectory = "/Users/kameshs";
          username = "kameshs";
        };
      };
      kameshs = self.homeConfigurations.kameshs.activationPackage;
      defaultPackage."x86_64-darwin" = self.kameshs;
    };
}
