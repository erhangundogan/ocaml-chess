let get_rank c = int_of_string (Char.escaped c)

let of_string s =
  begin match String.length s with
  | 0 -> (None, None)
  | 1 ->
    begin match String.get s 0 with
    | 'a'..'h' as file -> (Some file, None)
    | '1'..'8' as rank -> (None, Some (get_rank rank))
    | _ -> failwith "wrong move ex"
    end
  | 2 ->
    let (file, rank) = Move_to.of_string s in
    (Some file, Some rank)
  | _ -> failwith "wrong move ex"
  end

let to_notation (c, i) =
  match (c, i) with
  | Some chr, Some int -> (Char.escaped chr) ^ (string_of_int int)
  | Some chr, None     -> (Char.escaped chr)
  | None    , Some int -> (string_of_int int)
  | None    , None     -> ""

let to_string = to_notation
