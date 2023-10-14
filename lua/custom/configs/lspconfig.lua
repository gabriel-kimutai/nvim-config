local on_attach = require("lspconfig.configs").on_attach
local capabilities = require("lspconfig.configs").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

--[[ lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true
            }
        }
    }
})
]]


