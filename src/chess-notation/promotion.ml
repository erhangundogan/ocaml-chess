let of_string s =
  begin match s with
  | "e.p." -> None
  | _ ->
    begin match String.length s with
    | 0 -> None
    | 1 -> Some (Piece.of_notation s)
    | 2 -> Some (Piece.of_notation (Char.escaped (String.get s 1)))
    | _ -> failwith "wrong promotion"
    end
  end

let to_notation = function
  | Some p -> Piece.to_notation p
  | None -> ""

let to_string = function
  | Some p -> Piece.to_string p
  | None -> ""
