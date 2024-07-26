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
	dart-sass
    # Development tools
    git
    gcc
    fpc
    neovim
    vscode
    python3

    # System utilities
    customPackages.ags 
    fzf
    sass
    wget
    kitty
    yazi
    zoxide
    xdg-utils
    nfs-utils
    inotify-tools

    # Custom utilities
    customPackages.toggleScript
    customPackages.monitorRestartScript

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
    papirus-icon-theme

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

