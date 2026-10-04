local capabilities = require('blink.cmp').get_lsp_capabilities()

-- ============================================================================
-- Python
-- ============================================================================

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },

  filetypes = { 'python' },

  root_markers = {
    'uv.lock',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'poetry.lock',
    '.git',
  },

  capabilities = capabilities,

  before_init = function(params)
    local root = params.rootPath

    if not root then
      return
    end

    local python = root .. '/.venv/bin/python'

    if vim.fn.executable(python) == 1 then
      params.initializationOptions = vim.tbl_deep_extend('force', params.initializationOptions or {}, {
        pythonPath = python,
      })
    end
  end,
})

vim.lsp.enable 'pyright'

vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },

  filetypes = { 'python' },

  root_markers = {
    'pyproject.toml',
    'ruff.toml',
    '.ruff.toml',
    '.git',
  },

  capabilities = capabilities,

  settings = {},
})

vim.lsp.enable 'ruff'

-- ============================================================================
-- Lua
-- ============================================================================

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },

  filetypes = { 'lua' },

  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.git',
  },

  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },

      diagnostics = {
        globals = { 'vim', 'Snacks' },
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

vim.lsp.enable 'lua_ls'

-- ============================================================================
-- JavaScript / TypeScript
-- ============================================================================

vim.lsp.config('ts_ls', {
  cmd = { 'bun', 'x', 'tsc', '--lsp', '--stdio' },

  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },

  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    'bun.lock',
    'bun.lockb',
    'pnpm-lock.yaml',
    'yarn.lock',
    'package-lock.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'ts_ls'

-- ============================================================================
-- HTML
-- ============================================================================

vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },

  filetypes = { 'html' },

  root_markers = {
    'package.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'html'

-- ============================================================================
-- CSS / SCSS / LESS
-- ============================================================================

vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },

  filetypes = {
    'css',
    'scss',
    'less',
  },

  root_markers = {
    'package.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'cssls'

-- ============================================================================
-- Tailwind CSS
-- ============================================================================

vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },

  filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },

  root_markers = {
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.cjs',
    'postcss.config.mjs',
    'package.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'tailwindcss'

-- ============================================================================
-- JSON
-- ============================================================================

vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },

  filetypes = {
    'json',
    'jsonc',
  },

  root_markers = {
    'package.json',
    'tsconfig.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'jsonls'

-- ============================================================================
-- YAML
-- ============================================================================

vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },

  filetypes = {
    'yaml',
    'yaml.docker-compose',
  },

  root_markers = {
    '.yamllint',
    'package.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'yamlls'

-- ============================================================================
-- Markdown
-- ============================================================================

vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },

  filetypes = { 'markdown' },

  root_markers = {
    '.marksman.toml',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'marksman'

-- ============================================================================
-- Bash / Shell
-- ============================================================================

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },

  filetypes = {
    'sh',
    'bash',
    'zsh',
  },

  root_markers = {
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'bashls'

-- ============================================================================
-- TOML
-- ============================================================================

vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },

  filetypes = { 'toml' },

  root_markers = {
    'pyproject.toml',
    'Cargo.toml',
    'taplo.toml',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'taplo'

-- ============================================================================
-- Docker
-- ============================================================================

vim.lsp.config('dockerls', {
  cmd = { 'docker-langserver', '--stdio' },

  filetypes = {
    'dockerfile',
    'dockerfile_alt',
  },

  root_markers = {
    'docker-compose.yml',
    'docker-compose.yaml',
    'compose.yml',
    'compose.yaml',
    'Dockerfile',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'dockerls'

-- ============================================================================
-- SQL
-- ============================================================================

vim.lsp.config('sqls', {
  cmd = { 'sqls' },

  filetypes = { 'sql' },

  root_markers = {
    '.sqls.yml',
    '.sqls.yaml',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'sqls'

-- ============================================================================
-- Ruby
-- ============================================================================

vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },

  filetypes = { 'ruby' },

  root_markers = {
    'Gemfile',
    '.ruby-version',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'ruby_lsp'

-- ============================================================================
-- Go
-- ============================================================================

vim.lsp.config('gopls', {
  cmd = { 'gopls' },

  filetypes = {
    'go',
    'gomod',
    'gowork',
    'gotmpl',
  },

  root_markers = {
    'go.work',
    'go.mod',
    '.git',
  },

  capabilities = capabilities,

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

vim.lsp.enable 'gopls'

-- ============================================================================
-- Rust
-- ============================================================================

vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },

  filetypes = { 'rust' },

  root_markers = {
    'Cargo.toml',
    'rust-project.json',
    '.git',
  },

  capabilities = capabilities,

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

vim.lsp.enable 'rust_analyzer'

-- ============================================================================
-- Nix
-- ============================================================================

vim.lsp.config('nil_ls', {
  cmd = { 'nil' },

  filetypes = { 'nix' },

  root_markers = {
    'flake.nix',
    'default.nix',
    'shell.nix',
    '.git',
  },

  capabilities = capabilities,

  settings = {
    ['nil'] = {
      formatting = {
        command = { 'nixfmt' },
      },
    },
  },
})

vim.lsp.enable 'nil_ls'

-- ============================================================================
-- C / C++
-- ============================================================================

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
  },

  filetypes = {
    'c',
    'cpp',
    'objc',
    'objcpp',
  },

  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    'CMakeLists.txt',
    'Makefile',
    'meson.build',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'clangd'

-- ============================================================================
-- QML
-- ============================================================================

vim.lsp.config('qmlls', {
  cmd = { 'qmlls' },

  filetypes = { 'qml' },

  root_markers = {
    'CMakeLists.txt',
    'qmldir',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'qmlls'

-- ============================================================================
-- Java
-- ============================================================================

vim.lsp.config('jdtls', {
  cmd = { 'jdtls' },

  filetypes = { 'java' },

  root_markers = {
    'pom.xml',
    'build.gradle',
    'build.gradle.kts',
    'settings.gradle',
    'settings.gradle.kts',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'jdtls'

-- ============================================================================
-- Zig
-- ============================================================================

vim.lsp.config('zls', {
  cmd = { 'zls' },

  filetypes = { 'zig' },

  root_markers = {
    'build.zig',
    'build.zig.zon',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'zls'

-- ============================================================================
-- PHP
-- ============================================================================

vim.lsp.config('phpactor', {
  cmd = { 'phpactor', 'language-server' },

  filetypes = { 'php' },

  root_markers = {
    'composer.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'phpactor'

-- ============================================================================
-- CMake
-- ============================================================================

vim.lsp.config('neocmakelsp', {
  cmd = { 'neocmakelsp', 'stdio' },

  filetypes = { 'cmake' },

  root_markers = {
    'CMakeLists.txt',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'neocmakelsp'

-- ============================================================================
-- GraphQL
-- ============================================================================

vim.lsp.config('graphql', {
  cmd = {
    'graphql-lsp',
    'server',
    '-m',
    'stream',
  },

  filetypes = {
    'graphql',
    'gql',
  },

  root_markers = {
    'package.json',
    '.graphqlrc',
    '.graphqlrc.yml',
    '.graphqlrc.yaml',
    '.graphqlrc.json',
    '.git',
  },

  capabilities = capabilities,
})

vim.lsp.enable 'graphql'

-- ============================================================================
-- LSP Attach
-- ============================================================================

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buf = args.buf

    local function lsp_map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = buf,
        silent = true,
        noremap = true,
        desc = desc,
      })
    end

    -- ========================================================================
    -- Navigation → Telescope
    -- ========================================================================

    lsp_map('n', 'gd', function()
      require('telescope.builtin').lsp_definitions {
        reuse_win = true,
      }
    end, 'Go to definition')

    lsp_map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')

    lsp_map('n', 'gi', function()
      require('telescope.builtin').lsp_implementations {
        reuse_win = true,
      }
    end, 'Go to implementation')

    lsp_map('n', 'gr', function()
      require('telescope.builtin').lsp_references {
        reuse_win = true,
      }
    end, 'Find references')

    lsp_map('n', 'gy', function()
      require('telescope.builtin').lsp_type_definitions {
        reuse_win = true,
      }
    end, 'Go to type definition')

    -- ========================================================================
    -- Documentation
    -- ========================================================================

    lsp_map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')

    -- ========================================================================
    -- Refactoring
    -- ========================================================================

    lsp_map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')

    lsp_map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')

    -- ========================================================================
    -- Formatting
    -- ========================================================================

    lsp_map('n', '<leader>lf', function()
      require('conform').format {
        async = true,
        lsp_format = 'fallback',
      }
    end, 'Format buffer')

    -- ========================================================================
    -- Symbols → Trouble
    -- ========================================================================

    lsp_map('n', '<leader>cs', function()
      require('trouble').toggle {
        mode = 'symbols',
        focus = false,
      }
    end, 'Document symbols')

    lsp_map('n', '<leader>cl', function()
      require('trouble').toggle {
        mode = 'lsp',
        focus = false,
      }
    end, 'LSP')

    -- ========================================================================
    -- Code outline → Aerial
    -- ========================================================================

    lsp_map('n', '<leader>co', '<cmd>AerialToggle!<CR>', 'Code outline')

    -- ========================================================================
    -- Inlay hints
    -- ========================================================================

    if vim.lsp.inlay_hint then
      lsp_map('n', '<leader>lh', function()
        local enabled = vim.lsp.inlay_hint.is_enabled {
          bufnr = buf,
        }

        vim.lsp.inlay_hint.enable(not enabled, {
          bufnr = buf,
        })
      end, 'Toggle inlay hints')
    end
  end,
})

-- ============================================================================
-- Diagnostics
-- ============================================================================

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
