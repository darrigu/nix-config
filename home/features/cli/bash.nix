{ config
, lib
, ...
}:
with lib; let
  cfg = config.features.cli.bash;
in
{
  options.features.cli.bash.enable = mkEnableOption "enable bash configuration";

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      profileExtra = ''
        export NIX_LOG=info
        export TERMINAL=alacritty
      '';
      shellAliases = {
        v = "vim";
        ll = "ls -lah";
        ".." = "cd ..";
      };
    };
  };
}
