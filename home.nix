{
  programs = { home-manager = { enable = true; }; };

  # Import other Nix files
  imports = [ ./modules ./users/kameshs.nix ];

}
