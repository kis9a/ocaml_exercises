## Why

To learn satic type system and functional language.
[OCaml - Wikipedia](https://en.wikipedia.org/wiki/OCaml)

## Required

```bash
# brew
brew install ocaml
brew install opam
opam install alcotest
```

## Development

### LSP · Formatter

```bash
opam install ocaml-lsp-server
opam install ocamlformat
opam install ocamlformat-rpc
```

### LSP setup with coc.nvim example

[Language servers · neoclide/coc.nvim Wiki · GitHub](https://github.com/neoclide/coc.nvim/wiki/Language-servers#ocaml-and-reasonml)

**coc-settings.json**

```json:coc-settings.json
"coc.preferences.formatOnSaveFiletypes": ["ocaml", "..."]
"languageserver": {
  "ocaml-lsp": {
    "command": "opam",
    "args": ["config", "exec", "--", "ocamllsp"],
    "filetypes": ["ocaml", "reason"]
  },
}
```
