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
      
      # set NIX_PATH 
      export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH
  
      # direnv setup
      eval "$(direnv hook zsh)"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "dracula";
      custom = builtins.getEnv "HOME" + "/.config/oh-my-zsh";
    };

    shellAliases = shellConfig.aliases;
  };

  programs.direnv = {
    enableZshIntegration = true;
    enable = true;
    nix-direnv.enable = true;
  };

}
