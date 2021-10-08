let home-manager = (import ./nix/sources.nix).home-manager;
in
{
  # Let Home Manager install and manage itself.
  programs = {
    home-manager = {
      enable = true;
      path = "${home-manager}";
    };
  };

  # Import other Nix files
  imports = [ ./systems/solo-mac/kameshs.nix ];

}
