-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "custom.configs.lspconfig"
		end
	},
	{
		"rust-lang/rust.vim",
		ft = "css",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "lamo",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require "custom.configs.rust-tools"
		end,
		config = function(_, opts)
			require('rust-tools').setup(opts)
		end
	},
	{
		"windwp/nvim-autopairs",
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require("nvim-autopairs").setup {

				check_ts = true, -- treesitter integration
				disable_filetype = { "TelescopePrompt" },
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},

				fast_wrap = {
					map = "<M-e>",
					-- map = "<leader>w",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end,
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("custom.configs.colorschemes.gruvbox")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("custom.configs.neotree")
		end
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			-- "kyazdani42/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim" -- Optional, for persistent history
		},
		config = function()
			require("custom.configs.cokeline")
		end
	},
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{ "<leader>lm", ":Laravel related<cr>" },
			{
				"<leader>lt",
				function()
					require("laravel.tinker").send_to_tinker()
				end,
				mode = "v",
				desc = "Laravel Application Routes",
			},
		},
		event = { "VeryLazy" },
		config = function()
			require("laravel").setup()
			require("telescope").load_extension "laravel"
		end,
	},
	{
		{
			'jwalton512/vim-blade'
		}
	}

}

return plugins
