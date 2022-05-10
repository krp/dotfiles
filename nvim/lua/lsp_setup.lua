
-- Bash
-- Dependencies: npm install -g bash-language-server
require('lspconfig').bashls.setup{}

-- C/C++
-- Dependencies: clang >= 11
require('lspconfig').clangd.setup{}

-- CSS
-- Dependencies: npm install -g cssmodules-language-server
require('lspconfig').cssmodules_ls.setup{}

-- Deno
-- Dependencies: deno
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
require('lspconfig').denols.setup{}

-- Docker
-- Dependencies: npm install -g dockerfile-language-server-nodejs
require('lspconfig').dockerls.setup{}

-- Go
-- Dependencies:
--  go install github.com/nametake/golangci-lint-langserver@latest
--  go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1
-- require('lspconfig').golangci_lint_ls.setup{}
-- Or: go install golang.org/x/tools/gopls@latest
require('lspconfig').gopls.setup{}

-- Please
-- Dependencies: plz
require('lspconfig').please.setup{}

-- Prisma
-- Dependencies: npm install -g @prisma/language-server
require('lspconfig').prismals.setup{}

-- Pyre
-- Dependencies: pyre
-- Feature incomplete at the moment - May 2022
-- require('lspconfig').pyre.setup{}

-- Python
-- Dependencies: npm install -g typescript typescript-language-server
require('lspconfig').pyright.setup{}

-- Rust
-- Dependencies: rustup update && rustup component add rust-src
require('lspconfig').rust_analyzer.setup{}

-- Svelte
-- Dependencies: npm install -g svelte-language-server
require('lspconfig').svelte.setup{}

-- TailwindCSS: Leaving off until I start using it.

-- Terraform: To be added later

-- TypeScript
-- Dependencies: npm install -g typescript typescript-language-server
require('lspconfig').tsserver.setup{}

