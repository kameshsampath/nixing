# Programming packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    go
    gitAndTools.git
    # use java from Graal Java 11
    graalvm11-ce
    nodejs
    maven
    python39
    yarn
  ];
}
