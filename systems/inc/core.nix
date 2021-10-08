# Core packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    binutils
    coreutils
    diffutils
    direnv
    gawk
    gnugrep
    gnutar
    gzip
    gnused
    gnupg
    gettext
    ripgrep
    shellcheck
    starship
    tmux
    tree
    wget
  ];
}
