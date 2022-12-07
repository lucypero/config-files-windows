-- clone packer in %localappdata%\nvim\pack\packer\start\packer.nvim

require('packer').startup(function()
   use 'wbthomason/packer.nvim'
   use 'kjssad/quantum.vim'
   use 'sheerun/vim-polyglot'
   use {
     'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'} }
   }
end)

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.o.linespace=1
vim.o.signcolumn="yes:1"
vim.o.guifont="JetBrains Mono:h11"
vim.g.netrw_fastbrowse = 0
vim.o.linebreak = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.background="dark"
vim.g.mapleader = " "
vim.o.title = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.clipboard="unnamedplus"
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.expandtab = true
vim.o.hidden = true
vim.o.mouse='a'
vim.opt.formatoptions:remove('cro')
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff=10
vim.opt.shortmess:append('A')
vim.opt.sessionoptions:append('globals')
vim.o.showcmd = false

vim.cmd.colorscheme 'quantum'

function nn(ls, rs)
  vim.api.nvim_set_keymap("n", ls, rs, { noremap = true })
end

nn("<C-s>", ":w <cr>")
nn(":", ";")
nn(";", ":")
nn("<leader>v", ":vsplit <cr>")
nn("<C-q>", ":q <cr>")
nn("<C-w>", "<c-w><c-w>")
nn("<C-p>", ":Telescope find_files<cr>")
nn("<leader>o", ":Telescope buffers<cr>")
nn("<leader><f3>", ":e $MYVIMRC<cr>")
nn("<Tab>", ":bn <cr>")
nn("<C-Tab>", ":bp <cr>")

local actions = require("telescope.actions")

local delete_buffers = function(prompt_bufnr)
   actions.smart_send_to_qflist(prompt_bufnr)
   vim.api.nvim_command('cfdo :bd')
end

require('telescope').setup{
defaults = {
  layout_strategy = "horizontal",
  mappings = {
    i = {
      ["<esc>"] = actions.close,
      ["<C-x>"] = delete_buffers,
      },
    },
  },
}


