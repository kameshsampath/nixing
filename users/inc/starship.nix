{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;

      aws = {
        disabled = true;
      };

      gcloud = {
        disabled = true;
      };

      kubernetes = {
        disabled = false;
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[✖](bold red)";
      };

      package.disabled = true;
    };
  };
}
