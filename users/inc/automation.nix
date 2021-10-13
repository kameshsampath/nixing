# automation packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    terraform
    # TODO add ansible packages
  ];
}
