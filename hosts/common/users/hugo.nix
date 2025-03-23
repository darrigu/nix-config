{ config
, pkgs
, inputs
, ...
}: {
  users.users.hugo = {
    initialHashedPassword = "$y$j9T$IeCw4JVNDlR3pZaOezrZq1$wahZ09VFbvV7MKiQ5pj2TZcpMAQA.A55raeWilCXXSC";
    isNormalUser = true;
    description = "Hugo";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
    ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };
  home-manager.users.hugo =
    import ../../../home/hugo/${config.networking.hostName}.nix;
}
