type t = {
  king_side: bool;
  queen_side: bool
}

let create ~king_side ~queen_side = { king_side; queen_side }

let of_string c =
  create ~king_side:(c = "0-0") ~queen_side:(c = "0-0-0")

let to_notation { king_side; queen_side } =
  match king_side, queen_side with
  | true, false -> "0-0"
  | false, true -> "0-0-0"
  | _ -> failwith "wrong castling"

let to_string { king_side; queen_side } =
  match king_side, queen_side with
  | true, false -> "King side"
  | false, true -> "Queen side"
  | _ -> failwith "wrong castling"
