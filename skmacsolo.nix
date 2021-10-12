{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
    pkgs.cachix
    pkgs.nixpkgs-fmt
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  # caching config 
  nix.binaryCaches =
    [ "https://kameshsampath.cachix.org" "https://cache.nixos.org" ];

  nix.trustedBinaryCaches =
    [ "https://kameshsampath.cachix.org" "https://cache.nixos.org" ];

  nix.binaryCachePublicKeys = [
    "kameshsampath.cachix.org-1:f6HI5fu6v/XTB8MSJVXSVEavGjESiWlBi4nFD2ezxqc="
  ];

  nix.trustedUsers = [ "root" "kameshs" ];

}
