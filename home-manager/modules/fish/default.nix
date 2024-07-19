{ config, pkgs, ... }: {

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -x LS_COLORS "di=1;90:fi=0;37:ln=0;37:pi=0;37:so=0;37:bd=0;37:cd=0;37:or=0;37:mi=0;37:ex=0;37:*.tar=0;37:*.zip=0;37:*.bz2=0;37:*.deb=0;37:*.gz=0;37:*.rpm=0;37:*.jar=0;37:*.tgz=0;37:*.xz=0;37:*.z=0;37:*.Z=0;37:*.7z=0;37:*.rar=0;37:*.ace=0;37:*.arj=0;37:*.taz=0;37:*.lz=0;37:*.tlz=0;37:*.txz=0;37:*.mp3=0;37:*.flac=0;37:*.mp4=0;37:*.mkv=0;37:*.avi=0;37:*.mov=0;37:*.mpg=0;37:*.mpeg=0;37:*.webm=0;37:*.jpg=0;37:*.jpeg=0;37:*.png=0;37:*.gif=0;37:*.bmp=0;37:*.pbm=0;37:*.pgm=0;37:*.ppm=0;37:*.tga=0;37:*.xbm=0;37:*.xpm=0;37:*.tif=0;37:*.tiff=0;37:*.ico=0;37:*.svg=0;37:*.svgz=0;37:*.pdf=0;37:*.ps=0;37:*.eps=0;37:*.chm=0;37:*.djvu=0;37:*.ttf=0;37:*.otf=0;37:*.woff=0;37:*.woff2=0;37:*.eot=0;37:*.ttc=0;37:*.pfb=0;37:*.pfm=0;37:*.afm=0;37:*.amfm=0;37:*.pcf=0;37:*.snf=0;37:*.bdf=0;37:*.pfa=0;37:*.pfm=0;37:*.gdf=0;37:*.pcf=0;37:*.pcf.gz=0;37:*.psf=0;37:*.psfu=0;37:*.psf.gz=0;37:*.psfu.gz=0"
config > /dev/null 2>&1 
    '';

    functions = {
      nvim = ''
        kitty @ set-spacing padding=10
        command nvim $argv
        kitty @ set-spacing padding=10
      '';
      config = ''
        function config
          if test (count $argv) -eq 0
            echo "Usage: config <directory>"
            return 1
          end

          set base_dir1 ~/nix/home-manager/modules
          set file_path1 "$base_dir1/$argv[1]/default.nix"
          set base_dir2 ~/nix/nixos/modules
          set file_path2 "$base_dir2/$argv[1]/default.nix"

          if test -f $file_path1
            nvim $file_path1
          else if test -f $file_path2
            nvim $file_path2
          else
            echo "File not found in both directories."
            return 1
          end
        end

        function __fish_config_complete
          set -l base_dir1 ~/nix/home-manager/modules
          set -l base_dir2 ~/nix/nixos/modules
          for file in $base_dir1/*
            if test -d $file
              basename $file
            end
          end
          for file in $base_dir2/*
            if test -d $file
              basename $file
            end
          end
        end

        complete -c config -f -a "(__fish_config_complete)"
      '';
    };
  };
}

