-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({
    function(use)
        ---------------------
        -- Package manager --
        ---------------------
        use({'wbthomason/packer.nvim'})

        ----------------------
        -- Required plugins --
        ----------------------
        use('nvim-lua/plenary.nvim')

	----------------------------------------
	-- Theme, icons, statusbar, bufferbar --
	----------------------------------------
	use({
	    'kyazdani42/nvim-web-devicons',
	    config = function()
		require('nvim-web-devicons').setup()
	    end,
	})

        use({
            'sainnhe/edge',
            config = function()
                require('plugins.colorscheme')
            end,
        })

        use({
            'nvim-lualine/lualine.nvim',
            after = 'edge',
            event = 'BufEnter',
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
            config = function()
                require('plugins.lualine')
            end,
        })

       use({
            'akinsho/bufferline.nvim',
            event = 'BufEnter',
            config = function()
                require('plugins.bufferline')
            end,
        })

        --------------------------
        --      Editor UI       --
        --------------------------
        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.indentline')
            end,
        })

        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.gitsigns')
            end,
        })

        ---------------------------------
        -- Navigation and fuzzy search --
        ---------------------------------
        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('plugins.nvim-tree')
            end,
        })

        -------------------------
        -- Editing source code --
        -------------------------
        use({
            'numToStr/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('Comment').setup()
            end,
        })

        use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            config = function()
                require('nvim-autopairs').setup()
            end,
        })

        use({
            'ntpeters/vim-better-whitespace',
            event = 'BufRead',
            config = function()
                require('plugins.whitespace')
            end,
        })

        --------------
        -- Terminal --
        --------------
        use({
            'numToStr/FTerm.nvim',
            event = 'CursorHold',
            config = function()
                require('plugins.fterm')
            end,
        })


        -------------------------
        --   Language support  --
        -------------------------
        use({
            'plasticboy/vim-markdown',
            ft = { "markdown" },
            config = function()
                require('plugins.markdown')
            end,
        })

        --------------------------------
        --  Language server protocol  --
        --------------------------------
        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('plugins.lsp-config')
            end,
        })

        use({'hrsh7th/vim-vsnip'})

        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('plugins.nvim-cmp')
                end,
                requires = {'hrsh7th/vim-vsnip'},
            },
            {
                'hrsh7th/cmp-nvim-lsp',
                after = 'nvim-cmp',
            },
            {
                'hrsh7th/cmp-vsnip',
                after = 'nvim-cmp',
            },
            {
                'hrsh7th/cmp-path',
                after = 'nvim-cmp',
            },
            {
                'hrsh7th/cmp-buffer',
                after = 'nvim-cmp',
            },
        })

        -- Automatically set up your configuration after cloning packer.nvim
        -- Must be at the end, after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
