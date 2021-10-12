# Zsh config

{ config, lib, pkgs, ... }:
let shellConfig = import ./shell.nix { inherit config lib pkgs; };

in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    envExtra = shellConfig.env;
    completionInit = "autoload -U +X compinit && compinit";

    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      save = shellConfig.historySize;
      share = true;
    };

    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.4.0";
        sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
      };
    }];

    initExtra = ''
      source <(kubectl completion zsh)

      # direnv setup
      eval "$(direnv hook zsh)"

      # source kubectl aliases
      source "${pkgs.kameshsampath.kubectl-aliases}/kubectl_aliases"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "dracula";
      custom = "$HOME/.config/oh-my-zsh";
    };

    shellAliases = shellConfig.aliases;
  };

  programs.direnv = {
    enableZshIntegration = true;
    enable = true;
    nix-direnv.enable = true;
  };

}
