{ config, pkgs, inputs, ... }:

{ 
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      typescript-language-server
      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''require("Comment").setup()'';
      }

      {
        plugin = onedark-nvim;
        type = "lua";
        config = builtins.readFile(./nvim/plugin/onedark.lua);
      }
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

      lazydev-nvim
      nvim-cmp 
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile(./nvim/plugin/cmp.lua);
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile(./nvim/plugin/telescope.lua);
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      nvim-web-devicons

 
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';

  };
}

