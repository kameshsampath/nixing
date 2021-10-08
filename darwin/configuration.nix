{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ pkgs.vim ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  programs.zsh.enable = true;

  # using my custom packages
  nixpkgs.overlays = [ (import ../nix/overlays/my-packages.nix) ];

  nixpkgs.config.allowUnfree = true;
}
