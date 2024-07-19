{ config, pkgs, ... }: {

    programs.kitty = {
        enable = true;
        settings = {
        font_size = 16;
        background_opacity = "0.3";
        window_padding_width = 10;
        allow_remote_control = true;
        font_family = "JetBrains Mono";
        bold_font = "JetBrains Mono Medium";
        force_ltr = true;
    };
        };

}

