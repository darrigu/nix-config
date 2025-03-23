{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./fzf.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    coreutils
    fd
    ripgrep
    zip
    unzip
    htop
  ];
}
