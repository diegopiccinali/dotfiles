-----------------
--- Mini.Nvim ---
-----------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.wrap = true

vim.opt.linebreak = true

vim.opt.breakindent = true

vim.opt.showbreak = "↳ "

local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function() add('nvim-mini/mini.starter') require('mini.starter').setup({
        header = [[
██  ██  ██████  ████    ██████          ████    ██  ██  ██████  ██  ██
██████    ██    ██  ██    ██            ██  ██  ██  ██    ██    ██████
██████    ██    ██  ██    ██            ██  ██  ██  ██    ██    ██████
██  ██    ██    ██  ██    ██            ██  ██  ██  ██    ██    ██  ██
██  ██  ██████  ██  ██  ██████    ██    ██  ██    ██    ██████  ██  ██
        ]],

}) end)


--------------------
--- Mini.Editing ---
--------------------

now(function() add('nvim-mini/mini.ai') require('mini.ai').setup() end)

-- now(function() add('nvim-mini/mini.align') require('mini.align').setup() end)

now(function() add('nvim-mini/mini.comment') require('mini.comment').setup() end)

now(function() add('nvim-mini/mini.completion') require('mini.completion').setup() end)

now(function() add('nvim-mini/mini.keymap') require('mini.keymap').setup() end)

local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<Tab>',   { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>',    { 'minipairs_bs' })

local map_combo = require('mini.keymap').map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { 'i', 'c', 'x', 's' }
map_combo(mode, 'jk', '<BS><BS><Esc>')

-- To not have to worry about the order of keys, also map "kj"
map_combo(mode, 'kj', '<BS><BS><Esc>')

-- Escape into Normal mode from Terminal mode
map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

-- local notify_many_keys = function(key)
--   local lhs = string.rep(key, 5)
--   local action = function() vim.notify('Too many ' .. key) end
--   require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
-- end
-- notify_many_keys('h')
-- notify_many_keys('j')
-- notify_many_keys('k')
-- notify_many_keys('l')

now(function() add('nvim-mini/mini.move') require('mini.move').setup() end)

now(function() add('nvim-mini/mini.operators') require('mini.operators').setup() end)

now(function() add('nvim-mini/mini.pairs') require('mini.pairs').setup() end)

now(function() add('nvim-mini/mini.snippets') require('mini.snippets').setup() end)

now(function() add('nvim-mini/mini.splitjoin') require('mini.splitjoin').setup() end)

now(function() add('nvim-mini/mini.surround') require('mini.surround').setup() end)


---------------------
--- Mini.Workflow ---
---------------------

now(function() add('nvim-mini/mini.basics') require('mini.basics').setup() end)

now(function() add('nvim-mini/mini.bracketed') require('mini.bracketed').setup() end)

now(function() add('nvim-mini/mini.bufremove') require('mini.bufremove').setup() end)

now(function() add('nvim-mini/mini.clue') require('mini.clue').setup() end)

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- now(function() add('nvim-mini/mini.diff') require('mini.diff').setup() end)

now(function() add('nvim-mini/mini.extra') require('mini.extra').setup() end)

now(function() add('nvim-mini/mini.files') require('mini.files').setup() end)

-- now(function() add('nvim-mini/mini-git') require('mini-git').setup() end)

now(function() add('nvim-mini/mini.jump') require('mini.jump').setup() end)

now(function() add('nvim-mini/mini.jump2d') require('mini.jump2d').setup() end)

-- now(function() add('nvim-mini/mini.misc') require('mini.misc').setup() end)

now(function() add('nvim-mini/mini.pick') require('mini.pick').setup() end)

now(function() add('nvim-mini/mini.sessions') require('mini.sessions').setup() end)

now(function() add('nvim-mini/mini.visits') require('mini.visits').setup() end)


-----------------------
--- Mini.Appearance ---
-----------------------


now(function() add('nvim-mini/mini.animate') require('mini.animate').setup() end)

-- now(function() add('nvim-mini/mini.colors') require('mini.colors').setup() end)

now(function() add('nvim-mini/mini.base16') require('mini.base16').setup({
    palette = {
	base00 = '#1e1e2e',
	base01 = '#181825',
	base02 = '#313244',
	base03 = '#45475a',
	base04 = '#585b70',
	base05 = '#cdd6f4',
	base06 = '#f5e0dc',
	base07 = '#b4befe',
	base08 = '#f38ba8',
	base09 = '#fab387',
	base0A = '#f9e2af',
	base0B = '#a6e3a1',
	base0C = '#94e2d5',
	base0D = '#89b4fa',
	base0E = '#cba6f7',
	base0F = '#f2cdcd',
    },
    use_cterm = true,
    plugins = {
      default = false,
      ['nvim-mini/mini.nvim'] = true,
    },
}) end)


now(function() add('nvim-mini/mini.cursorword') require('mini.cursorword').setup() end)

-- now(function() add('nvim-mini/mini.hipatterns') require('mini.hipatterns').setup({
--
--   highlighters = {
--     -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
--     fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
--     hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
--     todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
--     note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
--
--     -- Highlight hex color strings (`#rrggbb`) using that color
--     hex_color = hipatterns.gen_highlighter.hex_color(),
--   },
--
-- }) end)

-- now(function() add('nvim-mini/mini.hues') require('mini.hues').setup() end)

now(function() add('nvim-mini/mini.icons') require('mini.icons').setup() end)

now(function() add('nvim-mini/mini.indentscope') require('mini.indentscope').setup() end)

now(function() add('nvim-mini/mini.map') require('mini.map').setup() end)

now(function() add('nvim-mini/mini.notify') require('mini.notify').setup() end)

now(function() add('nvim-mini/mini.statusline') require('mini.statusline').setup() end)

now(function() add('nvim-mini/mini.tabline') require('mini.tabline').setup() end)

now(function() add('nvim-mini/mini.trailspace') require('mini.trailspace').setup() end)


-------------------
--- Mini.Others ---
-------------------

-- now(function() add('nvim-mini/mini.doc') require('mini.doc').setup() end)

now(function() add('nvim-mini/mini.fuzzy') require('mini.fuzzy').setup() end)

-- now(function() add('nvim-mini/mini.test') require('mini.test').setup() end)


------------------------
--- LSP & Completion ---
------------------------

local lsp_list = {
		"bashls",
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"intelephense",
		"html",
		"ts_ls",
    "astro",
		"cssls",
	}

now(function() add ({
	source = 'neovim/nvim-lspconfig',
}) end)

now(function() add({
	source = 'williamboman/mason.nvim',
}) require ('mason').setup() end)

now(function() add({
	source = 'williamboman/mason-lspconfig.nvim',
	depends = {
		'williamboman/mason.nvim',
		'nvim/nvim-lspconfig',
	}
}) require ('mason-lspconfig').setup({
	ensure_installed = {
		"bashls",
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"intelephense",
		"html",
		"ts_ls",
    "astro",
		"cssls",
	},
}) end)

now(function() add({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'master',
	monitor = 'main',
}) require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"lua",
		"rust",
		"python",
		"php",
		"html",
		"javascript",
		"typescript",
    "astro",
		"css",
	},
	auto_install = true,
	highlight = { enable = true },

}) end )

for _, server in ipairs(lsp_list) do
  vim.lsp.config(server, {
    on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set('n', 'gl', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end,
  })
  vim.lsp.enable(server)
end

now(function()

  add({ source = 'hrsh7th/cmp-nvim-lsp' })
  add({ source = 'hrsh7th/cmp-buffer' })
  add({ source = 'hrsh7th/cmp-path' })
  add({ source = 'hrsh7th/cmp-cmdline' })
  add({ source = 'abeldekat/cmp-mini-snippets' })
  add({ source = 'hrsh7th/nvim-cmp' })

  add({
    source = 'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            insert({ body = args.body }) -- Insert at cursor
            cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            require("cmp.config").set_onetime({ sources = {} })
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'mini.snippets' },
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig').bashls.setup({
        capabilities = capabilities
      })
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities
      })
      require('lspconfig').rust_analyzer.setup({
        capabilities = capabilities
      })
      require('lspconfig').pyright.setup({
        capabilities = capabilities
      })
      require('lspconfig').intelephense.setup({
        capabilities = capabilities
      })
      require('lspconfig').html.setup({
        capabilities = capabilities
      })
      require('lspconfig').ts_ls.setup({
        capabilities = capabilities
      })
      require('lspconfig').cssls.setup({
        capabilities = capabilities
      })
      require('lspconfig').astro.setup({
        capabilities = capabilities
      })
    end,
  })
end)

--------------
--- Others ---
--------------

-- Identación

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Diagnósticos LSP
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Mostrar error LSP" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Error anterior" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Siguiente error" })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
