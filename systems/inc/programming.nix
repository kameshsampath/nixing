# Programming packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    go
    gitAndTools.git
    jdk
    nodejs
    python39
    yarn
  ];
}
