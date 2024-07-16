{ config, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    extraConfig = ''
      " Установите прозрачный фон для нормального режима
      highlight Normal guibg=NONE ctermbg=NONE

      " Установите прозрачный фон для терминала
      highlight NonText guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE

      " Включите нумерацию строк и умную нумерацию строк
      set number
      set relativenumber

      " Настройки табуляции
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set smarttab
      set autoindent
      set smartindent

      " Другие полезные настройки
      set hlsearch
      set incsearch
      set ignorecase
      set smartcase
      set clipboard=unnamedplus
      syntax enable
      filetype plugin indent on

      " Уберите символы на пустых строках
      set fillchars=vert:\ ,eob:\ 

      " Визуальный режим для отступов
      vnoremap > >gv
      vnoremap < <gv

      " Настройка выхода из режима вставки по jj
      inoremap jj <Esc>
'';
        };
}

