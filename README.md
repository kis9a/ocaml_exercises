## Why

To learn ocaml language.

> OCaml (/oʊˈkæməl/ oh-KAM-əl, formerly Objective Caml) is a general-purpose, multi-paradigm programming language which extends the Caml dialect of ML with object-oriented features.
> [OCaml - Wikipedia](https://en.wikipedia.org/wiki/OCaml)

## Required

```bash
# brew
brew install ocaml
brew install opam
opam install alcotest
opam install dune
echo 'eval $(opam config env)' >> ~/.zshrc
zsh

opam install . --deps-only
```

## Execute

view [Makefile](./Makefile)

```bash
make build
make test
```

## Development

### LSP · Formatter

```bash
opam install ocaml-lsp-server
opam install ocamlformat
opam install ocamlformat-rpc
```

### Formatter

[ocamlformat/ocamlformat-help.txt at main · ocaml-ppx/ocamlformat · GitHub](https://github.com/ocaml-ppx/ocamlformat/blob/main/ocamlformat-help.txt)

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

## Reference

- [MEMO.md](./MEMO.md)
- [99 problems OCaml](https://ocaml.org/learn/tutorials/99problems.html)
- [Correct + Efficient + Beautiful OCaml Programming](https://cs3110.github.io/textbook/cover.html)
- [M.Hiroi's Home Page / お気楽 OCaml プログラミング入門](http://www.nct9.ne.jp/m_hiroi/func/ocaml.html)
- [工学部専門科目「プログラミング言語」(2021 年度) - HackMD](https://hackmd.io/@aigarashi/r1az0wOHP/%2FpWliU6DiTa2yj8H0V_XUXA)
- _Motivation_ [ OCaml と Coq でブロックチェーンプログラミング](https://logmi.jp/tech/articles/321997)
