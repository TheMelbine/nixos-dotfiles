{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    settings = {
      font_size = 13;
      background_opacity = "0.3";
      window_padding_width = 10;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    functions = {
      nvim = ''
        kitty @ set-spacing padding=10
        command nvim $argv
        kitty @ set-spacing padding=10
      '';
    };
  };

    programs.oh-my-posh = {
      enable = true;
      enableFishIntegration = true;
      useTheme = "tiwahu";
    };
}
