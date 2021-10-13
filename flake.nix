{
  description = "Kameshs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  # https://nixos.wiki/wiki/Flakes#Output_schema
  outputs =
    { self, home-manager, nixpkgs, darwin, pre-commit-hooks, flake-utils, ... }:

    {
      # Build darwin flake using:
      # darwin-rebuild build --flake .
      darwinConfigurations."skmacsolo" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [ ./skmacsolo.nix ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."skmacsolo".pkgs;

      # 
      packages."x86_64-darwin".mypkgs = import ./pkgs;
      packages."x86_64-linux".mypkgs = import ./pkgs;

      # Home manager configurations
      homeConfigurations = {
        kameshs = home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, lib, ... }: {
            imports = [ ./home.nix ];
            nixpkgs = {
              overlays = [
                (self: super: {
                  kameshsampath = import ./pkgs { inherit (self) pkgs; };
                })
              ];
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

      # TODO #1 - enable pre-commit hooks
      # checks = {
      #   pre-commit-check = pre-commit-hooks.lib."x86_64-darwin".run {
      #     src = ./.;
      #     hooks = {
      #       shellcheck.enable = true;
      #       nixpkgs-fmt.enable = true;
      #       nix-linter.enable = true;
      #     };
      #     # generated files
      #     excludes = [ "^nix/sources\.nix$" ];
      #   };
      # };

      # devShell = nixpkgs.legacyPackages."x86_64-darwin".mkShell {
      #   inherit (self.checks."x86_64-darwin".pre-commit-check) shellHook;
      # };

    };
}
