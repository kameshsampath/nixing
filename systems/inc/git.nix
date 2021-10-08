# Git settings

{
  programs.git = {
    enable = true;

    extraConfig = {
      core = {
        editor = "code -w";
        autocrlf = "input";
      };

      user = {
        name = "Kamesh Sampath";
        email = "kamesh.sampath@hotmail.com";
        signingkey = "677FF1660AEF442C";
      };

      commit.gpgsign = "true";
      gpg.program = "gpg2";

      protocol.keybase.allow = "always";
      credential.helper = "osxkeychain";
      pull.rebase = "false";

      hub.protocol = "git";
    };

    ignores = [

      # See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

      # Eclipse
      ".project"
      ".classpath"
      ".settings/"
      "bin/"

      # IntelliJ
      ".idea"
      "*.ipr"
      "*.iml"
      "*.iws"

      # NetBeans
      "nb-configuration.xml"

      # Visual Studio Code
      ".vscode"

      # OSX
      ".DS_Store"

      # Vim
      "*.swp"
      "*.swo"

      # patch
      "*.orig"
      "*.rej"

      # Maven
      "target/"
      "pom.xml.tag"
      "pom.xml.releaseBackup"
      "pom.xml.versionsBackup"
      "release.properties"

      # dependencies
      "/node_modules"
      "/.pnp"
      ".pnp.js"

      # testing
      "/coverage"

      # production
      "/build"

      # misc
      ".DS_Store"
      ".env.local"
      ".env.development.local"
      ".env.test.local"
      ".env.production.local"

      "npm-debug.log*"
      "yarn-debug.log*"
      "yarn-error.log*"

      # Kuberenetes and minikube
      ".kube"
      "**/.minikube"
    ];
  };
}
