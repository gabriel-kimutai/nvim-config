local on_attach = require("lspconfig.configs").on_attach
local capabilities = require("lspconfig.configs").capabilities

local options = {
    server = {
        on_attach = on_attach,
        capabilities = capabilities
    }
}

return options
