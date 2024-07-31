{ config, pkgs, inputs, ... }:

{ 
  programs.neovim = 
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          local custom_onedark = require'lualine.themes.onedark';
         
          custom_onedark.normal.c.bg = 'none';

          require('lualine').setup {

            options = {
              theme = custom_onedark;
              section_separators = "",
              component_separators = "",
              disabled_filetypes = {},
              always_divide_middle = true,
              globalstatus = true,
            },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {{ 'branch'}},
              lualine_c = {{ 'filename'}},
              lualine_x = {
                { 'filetype', color = { bg = 'none' } }
              },
              lualine_y = {{ 'progress'}},
              lualine_z = {'location'}
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {{ 'filename', color = { bg = 'none' } }},
              lualine_x = {'location'},
              lualine_y = {},
              lualine_z = {}
            },
            tabline = {},
            extensions = {}
          }
        '';
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';

  };
}

