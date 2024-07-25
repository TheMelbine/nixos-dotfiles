vim.g.mapleader = ' '  -- Устанавливает пробел в качестве лидера
require('onedark').setup {
style = 'darker',
transparent = true,        -- Делает фон прозрачным
term_colors = true,        -- Использует цвета темы в терминале
ending_tildes = false,     -- Не показывает тильды в конце буфера
cmp_itemkind_reverse = false,
toggle_style_key = "<leader>ts",  -- Назначение переключения стиля на <leader>ts
toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
}
require('onedark').load()
