{ lib, ... }:
with lib; {
  imports = [
    ../inc/zsh.nix
    ../../modules
    ../inc/core.nix
    ../inc/container.nix
    ../inc/cloud.nix
    ../inc/git.nix
    ../inc/gpg.nix
    ../inc/gloo.nix
    ../inc/programming.nix
    ../inc/starship.nix
    # ../inc/tmux.nix
    ../inc/tools.nix
    ../inc/vim.nix
    ../inc/vscode.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kameshs";
  home.homeDirectory = "/Users/kameshs";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.sessionVariables = {
    TERM = "screen-256color";
    LC_ALL = "en_US.UTF-8";
    LANG = "en_US.UTF-8";
    ARCHFLAGS = "-arch x86_64";
  };

  home.sessionPath = [ "$HOME/.local/bin" ];

}
