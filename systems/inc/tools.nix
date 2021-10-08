# Core packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    asciinema
    fzf
    fzf-zsh
    hub
    hey
    httpie
    gist
    hub
    nixfmt
    packer
    pandoc
    yq-go
    jq
    tree
    yamllint
  ];
}
