return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'wakatime/vim-wakatime'

  use {
    'dracula/vim',
    config = function()
      vim.cmd 'colorscheme dracula'
    end,
  }

  -- WhichKey
  use {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('config.whichkey').setup()
    end,
  }

  -- Better Comment
  use {
    'numToStr/Comment.nvim',
    opt = true,
    keys = { 'gc', 'gcc', 'gbc' },
    config = function()
      require('Comment').setup {}
    end,
  }

  -- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
    config = function()
      require('config.nvimtree').setup()
    end,
  }

  -- Buffer Line
  use {
    'akinsho/nvim-bufferline.lua',
    event = 'BufReadPre',
    wants = 'nvim-web-devicons',
    config = function()
      require('config.bufferline').setup()
    end,
  }

  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  }

  -- Completion
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    opt = true,
    run = ":COQdeps",
    config = function()
      require("config.coq").setup()
    end,
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
    },
    disable = false,
  }

  -- fzf
  use { "junegunn/fzf", run = "./install --all" }
  -- use { "junegunn/fzf.vim" }
  use {
   "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  }
end)
