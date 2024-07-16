{ pkgs, ... }:

let
 customPackages = import ./customPackages/bundle.nix { inherit pkgs; };
in {

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    hyprland.enable = true;
    steam.enable = true;
    fish.enable = true;
  };

  fonts.packages = with pkgs; [
      jetbrains-mono
      customPackages.nerdFontsSymbols
  ];

  environment.systemPackages = with pkgs; [

    # Development tools
    git
    gcc
    fpc
    neovim
    vscode
    python3

    # System utilities
    wget
    kitty
    xdg-utils
    nfs-utils

    # Custom utilities
    customPackages.toggleScript

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
    obs-studio
    wl-screenrec
    xdg-desktop-portal-hyprland

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
    home-manager
  ];

}

