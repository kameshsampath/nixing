{ pkgs, ... }:

rec {
  # glooctl 
  glooctl = pkgs.callPackage ./glooctl { };
  # meshctl 
  meshctl = pkgs.callPackage ./meshctl { };
  # istio
  istio = pkgs.callPackage ./istio { };
  # civo 
  civo = pkgs.callPackage ./civo { };
}
