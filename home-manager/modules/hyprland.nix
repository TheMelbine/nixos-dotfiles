{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = ",preferred,auto,1";
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:caps_toggle";
      };

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 2;
        "col.active_border" = "rgba(657452ee)";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";

      };
cursor = {
  no_hardware_cursors = false;
};

      decoration = {
        rounding = 7;

        blur = {
          enabled = true;
          size = 5;
          passes = 6;
          new_optimizations = true;
        };

      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.00";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier, slide"
          "windowsOut,  1, 7,  myBezier,slide"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
           pseudotile =  true;
    split_width_multiplier = 1.25;
    force_split = 2;
    preserve_split = true;
    };


      master = {
      };

      misc = {
    	focus_on_activate = true;
    	disable_splash_rendering = false;
    	disable_hyprland_logo = true;
    	vrr = 1;
        no_direct_scanout = true;
    	force_default_wallpaper = 0;
    
	};

     windowrule = [
           ];

      exec-once = [
        "swww init"
        "ags -c /home/melbine/nix/home-manager/ags/config.js"
      ];

      bind = [
        "$mainMod, R, exec, ags -t launcher" 
        "$mainMod, Tab, exec, ags -t overview"
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, fullscreen,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, T, togglesplit, # dwindle"

        # Move focus with mainMod + arrow keys
        "$mainMod, h,  movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k,    movefocus, u"
        "$mainMod, j,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, h,  swapwindow, l"
        "$mainMod SHIFT, l, swapwindow, r"
        "$mainMod SHIFT, k,    swapwindow, u"
        "$mainMod SHIFT, j,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, h,  resizeactive, -60 0"
        "$mainMod CTRL, l, resizeactive,  60 0"
        "$mainMod CTRL, k,    resizeactive,  0 -60"
        "$mainMod CTRL, j,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4/cu/."
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
