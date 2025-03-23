{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ../features/desktop
    ./home.nix
  ];

  features = {
    cli = {
      bash.enable = true;
      fzf.enable = true;
      git.enable = true;
    };
    desktop = {
      wayland.enable = true;
    };
  };
}
