local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

g.python3_host_prog = '/usr/bin/python3.10'
g.mapleader = " "
g.localleader = "\\"
g.t_co = 256
-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.colorcolumn = '79'              -- Разделитель на 80 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.number = true                   -- Включаем нумерацию строк
opt.relativenumber = true           -- Вкл. относительную нумерацию строк
--opt.so=999                          -- Курсор всегда в центре экрана
opt.scrolloff = 7
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз
opt.mouse = 'a'
opt.hidden = true                   -- need hedden for terminal plugin
opt.clipboard = "unnamedplus"
-----------------------------------------------------------
-- Folder method /zc/zo/zm/za
-----------------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
--cmd'colorscheme onedark'
--cmd'colorscheme dracula'
g.tokyonight_style = "storm"
g.tokyonight_italic_variables = true
-- g.tokyonight_colors = { bg = "#3C3F41" }
-- g.tokyonight_colors = { bg = "#1d2021" }
cmd'colorscheme tokyonight'
--g.dracula_colors = { bg = "#3C3F41" }
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")
-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.softtabstop = 4
opt.autoindent = true
--opt.fileformat = unix
opt.encoding = 'utf-8'            -- str:  String encoding to use
opt.fileencoding = 'utf-8'        -- str:  File encoding to use
opt.signcolumn = "yes"           -- str:  Show the sign column



-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]


-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

