# Container packages

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    argocd
    docker-client
    kind
    kubectl
    kubectx
    kustomize
    kubernetes-helm
    podman
    stern
    minikube
    kameshsampath.kubectl-aliases
    k9s
  ];
}
