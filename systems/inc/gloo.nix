# Gloo packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [ kameshsampath.glooctl kameshsampath.meshctl ];

  programs.istio.enable = true;
}
