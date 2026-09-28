-- ~/.config/nvim/lua/config/lsp.lua
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ============================================================
-- Helpers
-- ============================================================

local function start_lsp(bufnr, config)
  vim.lsp.start {
    name = config.name,
    cmd = config.cmd,
    capabilities = capabilities,
    root_dir = vim.fs.root(bufnr, config.root_markers or { '.git' }),
    settings = config.settings,
  }
end

local function start_on_filetype(filetypes, config)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    callback = function(args)
      start_lsp(args.buf, config)
    end,
  })
end

-- ============================================================
-- Python
-- ============================================================

start_on_filetype('python', {
  name = 'pyright',
  cmd = { 'pyright-langserver', '--stdio' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
})

start_on_filetype('python', {
  name = 'ruff',
  cmd = { 'ruff', 'server' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {},
})

-- ============================================================
-- Lua
-- ============================================================

start_on_filetype('lua', {
  name = 'lua_ls',
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },

      diagnostics = {
        globals = { 'vim' },
      },

      workspace = {
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})

-- ============================================================
-- TypeScript / JavaScript
-- ============================================================

start_on_filetype({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, {
  name = 'ts_ls',
  cmd = {
    'bun',
    'x',
    'tsc',
    '--lsp',
    '--stdio',
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git',
  },
})

-- ============================================================
-- HTML
-- ============================================================

start_on_filetype('html', {
  name = 'html',
  cmd = { 'vscode-html-language-server', '--stdio' },
  root_markers = { 'package.json', '.git' },
})

-- ============================================================
-- CSS
-- ============================================================

start_on_filetype({ 'css', 'scss', 'less' }, {
  name = 'cssls',
  cmd = { 'vscode-css-language-server', '--stdio' },
  root_markers = { 'package.json', '.git' },
})

-- ============================================================
-- Ruby
-- ============================================================

start_on_filetype('ruby', {
  name = 'ruby_lsp',
  cmd = { 'ruby-lsp' },
  root_markers = { 'Gemfile', '.git' },
})

-- ============================================================
-- Go
-- ============================================================

start_on_filetype({ 'go', 'gomod', 'gowork', 'gotmpl' }, {
  name = 'gopls',
  cmd = { 'gopls' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,

      analyses = {
        unusedparams = true,
        shadow = true,
      },
    },
  },
})

-- ============================================================
-- Rust
-- ============================================================

start_on_filetype('rust', {
  name = 'rust_analyzer',
  cmd = { 'rust-analyzer' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },

      check = {
        command = 'clippy',
      },

      procMacro = {
        enable = true,
      },
    },
  },
})

-- ============================================================
-- Nix
-- ============================================================

start_on_filetype('nix', {
  name = 'nil_ls',
  cmd = { 'nil' },
  root_markers = { 'flake.nix', 'default.nix', 'shell.nix', '.git' },
  settings = {
    ['nil'] = {
      formatting = {
        command = { 'nixfmt' },
      },
    },
  },
})

-- ============================================================
-- C / C++
-- ============================================================

start_on_filetype({ 'c', 'cpp', 'objc', 'objcpp' }, {
  name = 'clangd',
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
  },
  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    'CMakeLists.txt',
    'Makefile',
    '.git',
  },
})

-- ============================================================
-- QML
-- ============================================================

start_on_filetype({ 'qml' }, {
  name = 'qmlls',
  cmd = {
    'qmlls',
  },
  root_markers = {
    'CMakeLists.txt',
  },
})

-- ============================================================
-- LSP Attach
-- ============================================================

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = {
      buffer = args.buf,
      silent = true,
    }

    -- Navigation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    -- Documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    -- Refactoring
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    -- Formatting
    vim.keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format {
        async = true,
      }
    end, opts)

    -- Symbols
    vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)

    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
  end,
})

-- ============================================================
-- Diagnostics
-- ============================================================

vim.diagnostic.config {
  virtual_text = true,

  signs = true,

  underline = true,

  update_in_insert = false,

  severity_sort = true,

  float = {
    border = 'rounded',
    source = 'if_many',
  },
}

-- ============================================================
-- Diagnostic Navigation
-- ============================================================

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  silent = true,
})

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  silent = true,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  silent = true,
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  silent = true,
})
