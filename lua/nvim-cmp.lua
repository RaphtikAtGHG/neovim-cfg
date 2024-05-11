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
