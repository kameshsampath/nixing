# Cloud Packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    google-cloud-sdk
    awscli2
    kameshsampath.civo
  ];
}
