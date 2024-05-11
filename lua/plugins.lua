return {
	{
    		'windwp/nvim-autopairs',
    		event = "InsertEnter",
    		config = true
  	},
	"rcarriga/nvim-notify",
	{
    		'nvim-lualine/lualine.nvim',
    		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				 options = {
    					icons_enabled = true,
    					theme = 'auto',
    					component_separators = { left = '', right = ''},
    					section_separators = { left = '', right = ''},
    					disabled_filetypes = {
      					statusline = {},
      					winbar = {},
    				},
    				ignore_focus = {},
    				always_divide_middle = true,
    				globalstatus = false,
    				refresh = {
      					statusline = 1000,
      					tabline = 1000,
      					winbar = 1000,
    				}
  			},
  			sections = {
    			lualine_a = {'mode'},
    				lualine_b = {'branch', 'diff', 'diagnostics'},
    				lualine_c = {'filename'},
    				lualine_x = {'encoding', 'fileformat', 'filetype'},
    				lualine_y = {'progress'},
    				lualine_z = {'location'}
  			},
  			inactive_sections = {
    				lualine_a = {},
    				lualine_b = {},
    				lualine_c = {'filename'},
    				lualine_x = {'location'},
    				lualine_y = {},
    				lualine_z = {}
  			},
  			tabline = {},
  			winbar = {},
  			inactive_winbar = {},
  			extensions = {} 
		}

		end
	},
	{
		 "andweeb/presence.nvim",
		 config = function()
			require("presence").setup({
    				-- General options
    				auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    				neovim_image_text   = "Neovim", -- Text displayed when hovered over the Neovim image
   					main_image          = "file",                   -- Main image display (either "neovim" or "file")
    				log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    				debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    				enable_line_number  = false,                      -- Displays the current line number instead of the current project
    				blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    				buttons             = {{ label = "Website", url = "https://tuxer.org"}, { label = "Github", url = "https://github.com/RaphtikAtGHG"}},                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    				file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    				show_time           = true,                       -- Show the timer

    				-- Rich Presence text options
    				editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    				file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    				git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    				plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    				reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    				workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    				line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end
	},
	"nordtheme/vim",
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
  		dependencies = { "nvim-tree/nvim-web-devicons" },
  		config = function()
    			-- calling `setup` is optional for customization
    			require("fzf-lua").setup({})
  		end
	},
	"github/copilot.vim",
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require'nvim-tree'.setup{ renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "U",
                    staged = "S",
                    unmerged = "UM",
                    renamed = "R",
                    deleted = "D",
                    untracked = "",
                    ignored = "I",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
    },}
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").clangd.setup{}
			require("lspconfig").asm_lsp.setup{}
 		end

	},	
	"nvim-tree/nvim-web-devicons",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip"
                               },
		config = function() 
			local cmp = require('cmp')
			local luasnip = require('luasnip')

	local select_opts = {behavior = cmp.SelectBehavior.Select}

	cmp.setup {
		snippet = {
			expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = 'path'},
		{ name = 'nvim_lsp'},
		{ name = 'luasnip', keyword_length = 2},
		{ name = 'buffer', keyword_length = 3}
	},
	window = {
		documentation = cmp.config.window.bordered()
	},

	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = '[LSP]',
				luasnip = '[SNIP]',
				buffer = '[BUF]',
				path = '[PATH]'
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end

	},
	mapping = {
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item(select_opts)
			else
				fallback()
			end
		end, {'i', 's'}),
		['<S-Tab>'] = cmp.mapping(function(fallback) 
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, {'i', 's'}),
		['<C-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.scroll_docs(4)
			else
				fallback()
			end
		end, {'i', 's'}),
		['<C-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.scroll_docs(-4)
			else
				fallback()
			end
		end, {'i', 's'})
		}	
		}
		end
	}
	
}
