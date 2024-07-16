{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.hyprland.enable = true;
  programs.steam.enable = true;
  programs.fish.enable = true;

  fonts.packages = with pkgs; [
      jetbrains-mono
      (import ./fonts/nerd-fonts-symbols.nix { inherit (pkgs) stdenv fetchzip lib; })
  ];

  environment.systemPackages = with pkgs; [
    # Development tools
    git
    fpc
    neovim
    vscode
    python3

    # System utilities
    wget
    kitty
    xdg-utils
    nfs-utils

    # Multimedia
    vlc

    # Gaming
    xboxdrv
    prismlauncher

    # Communication
    discord
    vesktop
    thunderbird
    telegram-desktop

    # Screenshot and screen recording
    slurp
    grimblast
    wl-screenrec
    obs-studio

    # System information
    fastfetch

    # Audio management
    pavucontrol

    # Desktop customization
    swww
    hyprpicker
    rofi-wayland
    wl-color-picker

    # Password management
    bitwarden-desktop

    # Clipboard management
    cliphist
    wl-clipboard

    # Note-taking and documentation
    obsidian

    # Miscellaneous
    todoist
    home-manager
    read-edid
  ];

}

