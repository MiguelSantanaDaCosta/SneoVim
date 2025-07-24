-- ~/.config/nvim/lua/options.lua

-- Neovim options configuration
vim.g.mapleader = " "  -- Set space as leader key
vim.g.maplocalleader = " "  -- Local leader key

-- General settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.cursorline = true      -- Highlight current line
vim.opt.signcolumn = "yes"     -- Always show sign column
vim.opt.mouse = "a"           -- Enable mouse in all modes
vim.opt.mousemodel = "extend"  -- Better mouse behavior

-- Indentation
vim.opt.tabstop = 2           -- Number of spaces tabs count for
vim.opt.shiftwidth = 2        -- Size of an indent
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart autoindenting
vim.opt.autoindent = true      -- Keep indent of current line

-- Search
vim.opt.ignorecase = true      -- Case insensitive search
vim.opt.smartcase = true       -- Case sensitive when uppercase present
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Incremental search

-- Performance
vim.opt.lazyredraw = true      -- Don't redraw while executing macros
vim.opt.updatetime = 250       -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 300       -- Time to wait for mapped sequence
vim.opt.ttimeoutlen = 10       -- Time to wait for key code sequence

-- Appearance
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.background = "dark"    -- Dark background
vim.opt.showmode = false       -- Don't show mode (handled by statusline)
vim.opt.title = true           -- Show filename in window title
vim.opt.scrolloff = 8          -- Lines of context around cursor
vim.opt.sidescrolloff = 8      -- Columns of context around cursor
vim.opt.pumheight = 10         -- Popup menu height
vim.opt.showtabline = 2        -- Always show tabline
vim.opt.laststatus = 3         -- Global statusline

-- Editing
vim.opt.clipboard = "unnamedplus"  -- System clipboard integration
vim.opt.undofile = true        -- Persistent undo
vim.opt.swapfile = false       -- Disable swap files
vim.opt.backup = false         -- Disable backup files
vim.opt.writebackup = false    -- Disable backup while writing
vim.opt.completeopt = { "menuone", "noselect" }  -- Better completion

-- Folding
vim.opt.foldmethod = "expr"    -- Use treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99         -- Don't fold by default
vim.opt.foldtext = "v:lua.require('utils').custom_fold_text()"

-- Window management
vim.opt.splitright = true      -- Vertical split to the right
vim.opt.splitbelow = true      -- Horizontal split below
vim.opt.equalalways = false    -- Don't auto-equalize window sizes

-- Wildmenu (command-line completion)
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore = {
  "*.o", "*.obj", "*.dll", "*.exe", "*.zip",
  "*.pyc", "*.class", "*.swp", "*.bak", "*.DS_Store",
  "node_modules", "vendor", ".git"
}

-- Formatting
vim.opt.formatoptions = vim.opt.formatoptions
  - "a"   -- Don't autoformat
  - "t"   -- Don't auto-wrap text
  + "c"   -- Wrap comments
  + "q"   -- Allow formatting comments with gq
  + "r"   -- Continue comments on Enter
  + "n"   -- Recognize numbered lists
  + "j"   -- Remove comment leader when joining lines
  + "l"   -- Don't break long lines in insert mode

-- Neovim specific
vim.opt.inccommand = "nosplit" -- Show substitute preview
vim.opt.conceallevel = 0       -- Don't conceal text (for markdown)
vim.opt.fileencoding = "utf-8" -- File encoding

-- GitSigns integration
vim.opt.signcolumn = "yes:2"   -- Always show sign column (2 columns)

-- Which-key delay
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- Comment.nvim integration
vim.g.skip_ts_context_commentstring_module = true

-- Disable some built-in plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Custom filetype options
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end
})

-- Custom functions
local utils = {}

function utils.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return line .. "  " .. line_count .. " lines"
end

return utils
