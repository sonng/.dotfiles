-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local utils = require("utils")

-- Setup Python Properly
if utils.executable('python3') then
    vim.g.python3_host_prog = fn.exepath('python3')
end

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

-- Automatically source and re-compile packer whenever you save this file.
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'gelguy/wilder.nvim',
  }

  use 'simrat39/symbols-outline.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
  }

  use 'nvim-treesitter/nvim-treesitter-context'

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {
              'williamboman/mason.nvim',
              run = function()
                  pcall(vim.cmd, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'},

          -- Rust
          {'simrat39/rust-tools.nvim'},

          -- Debugging
          {'nvim-lua/plenary.nvim'},
          {'mfussenegger/nvim-dap'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  -- Harpoon
  use {
      'ThePrimeagen/harpoon',
      requires = {
          {'nvim-lua/plenary.nvim'},
      }
  }

  use { 
      "catppuccin/nvim", 
      name = "catppuccin",
      config = function()
          vim.cmd('colorscheme catppuccin')
      end
  }

  --[[
  use {
      "mcchrish/zenbones.nvim",
      requires = { "rktjmp/lush.nvim" },
      config = function()
          vim.cmd('set background=light')
          vim.cmd('colorscheme zenbones')
      end
  }
  --]]

  --[[
  use {
      "sainnhe/everforest",
      config = function()
          vim.cmd('set background=light')
          vim.cmd('let g:everforest_background = "hard"')
          vim.cmd('colorscheme everforest')
      end
  }
  --]]

  --[[
  use {
      'folke/tokyonight.nvim',
      name = 'tokyonight',
      config = function()
          vim.cmd('colorscheme tokyonight-night')
      end
  }
  --]]

  -- LSP Progress
  use {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      config = function()
        require("fidget").setup { }
      end,
  }
  
  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- HOP!
  use {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  -- Status Line
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  -- Tmux 
  if utils.executable("tmux") then
      use { "tmux-plugins/vim-tmux", ft = { "tmux" } }
  end


  -- Copilot
  use("github/copilot.vim")

end)


