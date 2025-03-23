{ config
, lib
, ...
}:
with lib; let
  cfg = config.features.cli.git;
in
{
  options.features.cli.git.enable = mkEnableOption "enable git configuration";

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "darrigu";
      userEmail = "darigu.pro@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    programs.gitui.enable = true;
  };
}
