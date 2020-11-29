let get_rank c = int_of_string (Char.escaped c)

let of_string s =
  let file = String.get s 0 in
  let rank = get_rank @@ String.get s 1 in
  (file, rank)

let to_notation (c, i) = (Char.escaped c) ^ (string_of_int i)

let to_string = to_notation
