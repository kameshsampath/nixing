# Core packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    kind
    kubectl
    kubectx
    kustomize
    kubernetes-helm
    podman
    stern
    docker-client
  ];
}
