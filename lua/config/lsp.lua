local capabilities = require("blink.cmp").get_lsp_capabilities()

-- ============================================================================
-- Helpers
-- ============================================================================

local function start_lsp(bufnr, config)
    local root = vim.fs.root(bufnr, config.root_markers or {".git"})

    if not root then
        return
    end

    vim.lsp.start({
        name = config.name,
        cmd = config.cmd,
        capabilities = capabilities,
        root_dir = root,
        settings = config.settings
    })
end

local function start_on_filetype(filetypes, config)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function(args)
            start_lsp(args.buf, config)
        end
    })
end

-- ============================================================================
-- Python
-- ============================================================================

start_on_filetype("python", {
    name = "pyright",
    cmd = {"pyright-langserver", "--stdio"},

    root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "poetry.lock", "uv.lock",
                    ".git"}
})

start_on_filetype("python", {
    name = "ruff",
    cmd = {"ruff", "server"},

    root_markers = {"pyproject.toml", "ruff.toml", ".ruff.toml", ".git"},

    settings = {}
})

-- ============================================================================
-- Lua
-- ============================================================================

start_on_filetype("lua", {
    name = "lua_ls",
    cmd = {"lua-language-server"},

    root_markers = {".luarc.json", ".luarc.jsonc", ".git"},

    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },

            diagnostics = {
                globals = {"vim", "Snacks"}
            },

            workspace = {
                checkThirdParty = false
            },

            telemetry = {
                enable = false
            }
        }
    }
})

-- ============================================================================
-- JavaScript / TypeScript
-- ============================================================================

start_on_filetype({"javascript", "javascriptreact", "typescript", "typescriptreact"}, {
    name = "ts_ls",

    cmd = {"bun", "x", "tsc", "--lsp", "--stdio"},

    root_markers = {"tsconfig.json", "jsconfig.json", "package.json", "bun.lock", "bun.lockb", "pnpm-lock.yaml",
                    "yarn.lock", "package-lock.json", ".git"}
})

-- ============================================================================
-- HTML
-- ============================================================================

start_on_filetype("html", {
    name = "html",
    cmd = {"vscode-html-language-server", "--stdio"},

    root_markers = {"package.json", ".git"}
})

-- ============================================================================
-- CSS / SCSS / LESS
-- ============================================================================

start_on_filetype({"css", "scss", "less"}, {
    name = "cssls",

    cmd = {"vscode-css-language-server", "--stdio"},

    root_markers = {"package.json", ".git"}
})

-- ============================================================================
-- Tailwind CSS
-- ============================================================================

start_on_filetype({"html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact"}, {
    name = "tailwindcss",

    cmd = {"tailwindcss-language-server", "--stdio"},

    root_markers = {"tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts",
                    "postcss.config.js", "postcss.config.cjs", "postcss.config.mjs", "package.json", ".git"}
})

-- ============================================================================
-- JSON
-- ============================================================================

start_on_filetype({"json", "jsonc"}, {
    name = "jsonls",

    cmd = {"vscode-json-language-server", "--stdio"},

    root_markers = {"package.json", "tsconfig.json", ".git"}
})

-- ============================================================================
-- YAML
-- ============================================================================

start_on_filetype({"yaml", "yaml.docker-compose"}, {
    name = "yamlls",

    cmd = {"yaml-language-server", "--stdio"},

    root_markers = {".yamllint", "package.json", ".git"}
})

-- ============================================================================
-- Markdown
-- ============================================================================

start_on_filetype("markdown", {
    name = "marksman",

    cmd = {"marksman", "server"},

    root_markers = {".marksman.toml", ".git"}
})

-- ============================================================================
-- Bash / Shell
-- ============================================================================

start_on_filetype({"sh", "bash", "zsh"}, {
    name = "bashls",

    cmd = {"bash-language-server", "start"},

    root_markers = {".git"}
})

-- ============================================================================
-- TOML
-- ============================================================================

start_on_filetype("toml", {
    name = "taplo",

    cmd = {"taplo", "lsp", "stdio"},

    root_markers = {"pyproject.toml", "Cargo.toml", "taplo.toml", ".git"}
})

-- ============================================================================
-- Docker
-- ============================================================================

start_on_filetype({"dockerfile", "dockerfile_alt"}, {
    name = "dockerls",

    cmd = {"docker-langserver", "--stdio"},

    root_markers = {"docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml", "Dockerfile", ".git"}
})

-- ============================================================================
-- SQL
-- ============================================================================

start_on_filetype("sql", {
    name = "sqls",

    cmd = {"sqls"},

    root_markers = {".sqls.yml", ".sqls.yaml", ".git"}
})

-- ============================================================================
-- Ruby
-- ============================================================================

start_on_filetype("ruby", {
    name = "ruby_lsp",

    cmd = {"ruby-lsp"},

    root_markers = {"Gemfile", ".ruby-version", ".git"}
})

-- ============================================================================
-- Go
-- ============================================================================

start_on_filetype({"go", "gomod", "gowork", "gotmpl"}, {
    name = "gopls",

    cmd = {"gopls"},

    root_markers = {"go.work", "go.mod", ".git"},

    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,

            analyses = {
                unusedparams = true,
                shadow = true
            }
        }
    }
})

-- ============================================================================
-- Rust
-- ============================================================================

start_on_filetype("rust", {
    name = "rust_analyzer",

    cmd = {"rust-analyzer"},

    root_markers = {"Cargo.toml", "rust-project.json", ".git"},

    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true
            },

            check = {
                command = "clippy"
            },

            procMacro = {
                enable = true
            }
        }
    }
})

-- ============================================================================
-- Nix
-- ============================================================================

start_on_filetype("nix", {
    name = "nil_ls",

    cmd = {"nil"},

    root_markers = {"flake.nix", "default.nix", "shell.nix", ".git"},

    settings = {
        ["nil"] = {
            formatting = {
                command = {"nixfmt"}
            }
        }
    }
})

-- ============================================================================
-- C / C++
-- ============================================================================

start_on_filetype({"c", "cpp", "objc", "objcpp"}, {
    name = "clangd",

    cmd = {"clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu"},

    root_markers = {"compile_commands.json", "compile_flags.txt", "CMakeLists.txt", "Makefile", "meson.build", ".git"}
})

-- ============================================================================
-- QML
-- ============================================================================

start_on_filetype("qml", {
    name = "qmlls",

    cmd = {"qmlls"},

    root_markers = {"CMakeLists.txt", "qmldir", ".git"}
})

-- ============================================================================
-- Java
-- ============================================================================

start_on_filetype("java", {
    name = "jdtls",

    cmd = {"jdtls"},

    root_markers = {"pom.xml", "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts", ".git"}
})

-- ============================================================================
-- Zig
-- ============================================================================

start_on_filetype("zig", {
    name = "zls",

    cmd = {"zls"},

    root_markers = {"build.zig", "build.zig.zon", ".git"}
})

-- ============================================================================
-- PHP
-- ============================================================================

start_on_filetype("php", {
    name = "phpactor",

    cmd = {"phpactor", "language-server"},

    root_markers = {"composer.json", ".git"}
})

-- ============================================================================
-- CMake
-- ============================================================================

start_on_filetype("cmake", {
    name = "neocmake",

    cmd = {"neocmakelsp"},

    root_markers = {"CMakeLists.txt", ".git"}
})

-- ============================================================================
-- GraphQL
-- ============================================================================

start_on_filetype({"graphql", "gql"}, {
    name = "graphql",

    cmd = {"graphql-lsp", "server", "-m", "stream"},

    root_markers = {"package.json", ".graphqlrc", ".graphqlrc.yml", ".graphqlrc.yaml", ".graphqlrc.json", ".git"}
})

-- ============================================================================
-- LSP Attach
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf

        local function lsp_map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = buf,
                silent = true,
                noremap = true,
                desc = desc
            })
        end

        -- ====================================================================
        -- Navigation → Telescope
        -- ====================================================================

        lsp_map("n", "gd", function()
            require("telescope.builtin").lsp_definitions({
                reuse_win = true
            })
        end, "Go to definition")

        lsp_map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

        lsp_map("n", "gi", function()
            require("telescope.builtin").lsp_implementations({
                reuse_win = true
            })
        end, "Go to implementation")

        lsp_map("n", "gr", function()
            require("telescope.builtin").lsp_references({
                reuse_win = true
            })
        end, "Find references")

        lsp_map("n", "gy", function()
            require("telescope.builtin").lsp_type_definitions({
                reuse_win = true
            })
        end, "Go to type definition")

        -- ====================================================================
        -- Documentation
        -- ====================================================================

        lsp_map("n", "K", vim.lsp.buf.hover, "Hover documentation")

        -- ====================================================================
        -- Refactoring
        -- ====================================================================

        lsp_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

        lsp_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

        -- ====================================================================
        -- Formatting
        -- ====================================================================

        lsp_map("n", "<leader>lf", function()
            require("conform").format({
                async = true,
                lsp_format = "fallback"
            })
        end, "Format buffer")

        -- ====================================================================
        -- Symbols → Trouble
        -- ====================================================================

        lsp_map("n", "<leader>cs", function()
            require("trouble").toggle({
                mode = "symbols",
                focus = false
            })
        end, "Document symbols")

        lsp_map("n", "<leader>cl", function()
            require("trouble").toggle({
                mode = "lsp",
                focus = false
            })
        end, "LSP")

        -- ====================================================================
        -- Code outline → Aerial
        -- ====================================================================

        lsp_map("n", "<leader>co", "<cmd>AerialToggle!<CR>", "Code outline")

        -- ====================================================================
        -- Inlay hints
        -- ====================================================================

        if vim.lsp.inlay_hint then
            lsp_map("n", "<leader>lh", function()
                local enabled = vim.lsp.inlay_hint.is_enabled({
                    bufnr = buf
                })

                vim.lsp.inlay_hint.enable(not enabled, {
                    bufnr = buf
                })
            end, "Toggle inlay hints")
        end
    end
})

-- ============================================================================
-- Diagnostics
-- ============================================================================

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = "if_many"
    }
})
