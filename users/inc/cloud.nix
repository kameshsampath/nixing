# Cloud Packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    awscli2
    aws-iam-authenticator
    azure-cli
    kameshsampath.civo
    google-cloud-sdk
  ];
}
