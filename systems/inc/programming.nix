# Programming packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    go
    gitAndTools.git
    adoptopenjdk-openj9-bin-16
    nodejs
    maven
    python39
    yarn
  ];
}
