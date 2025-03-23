{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.features.desktop.wayland;
in
{
  options.features.desktop.wayland.enable = mkEnableOption "wayland extra tools and configuration";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
      wlogout
      swaybg
    ];

    services.mako = {
      enable = true;
      defaultTimeout = 10000;
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      borderColor = "#fab387";
      progressColor = "over #313244";
      extraConfig = ''
        [urgency=high]
        border-color=#fab387
      '';
    };

    services.swayosd.enable = true;

    programs.fuzzel = {
      enable = true;
      settings = {
        colors = {
          background = "1e1e2edd";
          text = "cdd6f4ff";
          prompt = "bac2deff";
          placeholder = "7f849cff";
          input = "cdd6f4ff";
          match = "fab387ff";
          selection = "585b70ff";
          selection-text = "cdd6f4ff";
          selection-match = "fab387ff";
          counter = "7f849cff";
          border = "fab387ff";
        };
      };
    };
  };
}
