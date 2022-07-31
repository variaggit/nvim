local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "bet.lsp.lsp-signature"
require "bet.lsp.lsp-installer"
require("bet.lsp.handlers").setup()
require "bet.lsp.null-ls"
