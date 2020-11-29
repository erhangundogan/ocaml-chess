.PHONY: all clean test doc examples

all:
	dune build

test:
	dune runtest

examples:
	dune exec examples/read_notation.exe

clean:
	dune clean

doc:
	dune build @doc
