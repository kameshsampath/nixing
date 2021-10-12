{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      relativenumber = true;
      number = true;
      expandtab = true;
      mouse = "a";
      tabstop = 2;
      shiftwidth = 2;
    };

    plugins = with pkgs.vimPlugins; [ indentLine ale ];

    extraConfig = ''
      set sts=2

      syntax on

      set ruler
      set number

      " identation
      let g:indentLine_char = '⦙'
      set foldlevelstart=20

      "  Lint config
      let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
      let g:ale_sign_error = '✘'
      let g:ale_sign_warning = '⚠'
      let g:ale_lint_on_text_changed = 'never'

      " Put these lines at the very end of your vimrc file.

      " Load all plugins now.
      " Plugins need to be added to runtimepath before helptags can be generated.
      packloadall
      " Load all of the helptags now, after plugins have been loaded.
      " All messages and errors will be ignored.
      silent! helptags ALL
    '';
  };
}
