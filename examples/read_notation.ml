let () =
  let open Chess_notation.Main in
  print_endline "Please input algebraic notation and then press enter:"
  |> read_line
  |> read_notation
  |> pp Format.std_formatter
