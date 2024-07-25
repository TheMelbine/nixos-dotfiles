local onedark = require'lualine.themes.onedark'

-- Настройка фона для секций b в разных режимах
local sections = {'normal', 'insert', 'visual', 'replace', 'command', 'inactive'}
for _, section in ipairs(sections) do
  onedark[section].b.bg = 'none'
end

return onedark

