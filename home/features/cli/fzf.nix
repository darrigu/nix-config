{ config
, lib
, ...
}:
with lib; let
  cfg = config.features.cli.fzf;
in
{
  options.features.cli.fzf.enable = mkEnableOption "enable fzf configuration";

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
    };
  };
}
