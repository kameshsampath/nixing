{ config, ... }: {
  aliases = {
    cleansrc =
      "git fetch upstream && git checkout master && git reset --hard upstream/master";
    cls = "clear";
    filecount = "find . -type f | wc -l";
    ga = "git add";
    gb = "git branch";
    gc = "git checkout";
    gcb = "git checkout -b";
    gcl = "git clone";
    gd = "git diff";
    gf = "git reflog";
    git = "hub";
    gitpristine = "git reset --hard && git clean -df .";
    gl = "git log";
    gm = "git commit -m";
    gma = "git commit -am";
    gp = "git push;";
    gpu = "git pull";
    gra = "git remote add";
    grr = "git remote rm";
    gs = "git status";
    gta = "git tag -a -m";
    jxxopts =
      "jxxopts=java -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal -version";
    l = "ls --color=auto -al";
    ll = "ls --color=auto -GFhl";
    ls = "ls --color=auto -GFh";
    lsd = "ls --color=auto -aFhlG";
    mvnci = "mvn clean install";
    mvncp = "mvn clean package";
    mvnwrapper = "mvn -N io.takari:maven:wrapper";
    ports = "netstat -tulanp";
    repo = "cd $HOME/git";
    rm = "rm -i";
    tmuxconfig = "code $HOME/.tmux.conf";
    wget = "wget -c";
    wordy = "wc -w * | sort | tail -n10";
    watch = "watch ";
    streamcode = "code --user-data-dir=$HOME/code_profiles/streaming/data";
  };

  env = ''
      export PATH=$HOME/bin:$PATH
      export GOPATH=${config.home.homeDirectory}
      export PATH=$HOME/bin:$PATH
      if [ -d $HOME/.krew/bin ]; then
        export PATH=$HOME/.krew/bin:$PATH
      fi
    export KUBE_EDITOR="code -w";
      export EDITOR="code -w";
  '';

  historySize = 10000;
}
