local lspconfig = require('lspconfig')

lspconfig.html.setup {
  filetypes = { "html", "templ" }
}
lspconfig.htmx.setup {
  filetypes = { "html", "templ" }
}


lspconfig.volar.setup {
  filetypes = { "vue", "typescript", "javascript" },
  init_options = {
    vue = {
      hybridMode = false,
    }
  }
}
