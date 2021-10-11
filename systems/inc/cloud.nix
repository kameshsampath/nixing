# Cloud Packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    awscli2
    azure-cli
    kameshsampath.civo
    google-cloud-sdk
  ];
}
