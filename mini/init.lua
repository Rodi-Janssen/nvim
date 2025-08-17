-- Set <Space> as the first mapping before lazy.nvim initialization
-- so that plugins can use <leader> in their own keymaps/configs.
vim.g.mapleader       = ' '
vim.g.maplocalleader  = ' '

-- Bootstrap lazy.nvim if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  -- mini.nvim: the lightweight "mini.basics" and more
  {
    "echasnovski/mini.nvim",
    version = "*",                         -- use latest stable
    config = function()
      require("mini.basics").setup()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {},  -- using defaults
    config   = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- Lazygit integration inside a floating Neovim window
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open Lazygit" },
    },
  },

  -- Mason: install LSP servers, DAPs, linters, etc.
  {
    "mason-org/mason.nvim",
    opts = {},  -- default setup
  },

  -- Treesitter: syntax highlighting, code-aware folding, indentation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim"},
        sync_install    = false,
        highlight       = { enable = true },
        indent          = { enable = true },
      })
    end,
  },
})

-- === Your Neovim configuration ===
vim.o.tabstop        = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.cmd("language en_US")

-- Fix ESC behavior in terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Enable line numbers
vim.wo.number         = true
vim.wo.relativenumber = true

-- Custom keybindings
vim.keymap.set('n', '<Down>',
  ':e C:/Users/rodij/AppData/Local/nvim/init.lua<CR>', {})
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>',
  { desc = "Go to previous tab" })
vim.keymap.set('n', '<C-l>', ':tabnext<CR>',
  { desc = "Go to next tab" })
vim.keymap.set('n', '<C-n>', ':tabnew<CR>',
  { desc = "Open new tab" })
vim.keymap.set('n', '<C-s>', ':w<CR>', {})

-- <leader>ff : Find files in current working directory
vim.keymap.set('n', '<leader>ff', function()
  require('mini.pick').builtin.files()
end, { desc = 'Find files' })

-- <leader>fb : Find open buffers
vim.keymap.set('n', '<leader>fb', function()
  require('mini.pick').builtin.buffers()
end, { desc = 'Find buffers' })

-- <leader>fc : Find files in your Neovim config
vim.keymap.set('n', '<leader>fc', function()
  require('mini.pick').builtin.files({
    source = { cwd = vim.fn.stdpath('config') },
  })
end, { desc = 'Find config files' })


vim.o.hlsearch      = false
vim.o.mouse         = 'a'
vim.o.clipboard     = 'unnamedplus'
vim.o.breakindent   = true
vim.o.undofile      = true
vim.o.ignorecase    = true
vim.o.smartcase     = true
vim.wo.signcolumn   = 'yes'
vim.o.updatetime    = 250
vim.o.timeoutlen    = 300
vim.o.completeopt   = 'menuone,noselect'
vim.o.termguicolors = true

-- Better default keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k',
  "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j',
  "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', ';', ':')

--let you switch buffers without saving changes (prevents buffer unload)
vim.o.hidden = true
--friendly splits—new splits open in predictable directions
vim.o.splitbelow = true
vim.o.splitright = true
--you have those, but if jumping maps feel sluggish, tuning these helps
vim.o.updatetime = 250
timeoutlen = 300
