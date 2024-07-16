{ pkgs, ... }:

let
 customPackages = import ./customPackages/bundle.nix { inherit pkgs; };
in {

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

(import ./scripts/toggle.nix { inherit pkgs; })

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

