Chess
=====

This is an OCaml library for Chess gaming.

It's in development.

# Features

- Algebraic notations to read and write. It doesn't evaluate movement logic.

### Examples

```bash
$ dune exec examples/read_notation.exe
Please input algebraic notation and then press enter:
dxc3e.p.
Piece  | Move from | Capture | Move to | Promotion | En passant | Check/Mate
Pawn   | d         | yes     | c3      |           | yes        |
```

### Run tests

```bash
$ dune runtest
```

### Docs (requires [odoc](https://github.com/ocaml/odoc) package)

```bash
$ dune build @doc
$ open _build/default/_doc/_html/index.html
```

### Build

```bash
$ dune build
```
