type t = King | Queen | Rook | Bishop | Knight | Pawn

let of_string = function
 | "King"   -> King
 | "Queen"  -> Queen
 | "Rook"   -> Rook
 | "Bishop" -> Bishop
 | "Knight"
 | "Springer" -> Knight
 | "Pawn"   -> Pawn
 | _ -> failwith "Invalid piece string"

let to_string = function
 | King   -> "King"
 | Queen  -> "Queen"
 | Rook   -> "Rook"
 | Bishop -> "Bishop"
 | Knight -> "Knight"
 | Pawn   -> "Pawn"

let of_notation = function
  | ""  -> Pawn
  | "K" -> King
  | "Q" -> Queen
  | "R" -> Rook
  | "B" -> Bishop
  | "N"
  | "S" -> Knight
  | _ -> failwith "Invalid piece letter"

let to_notation = function
 | King   -> "K"
 | Queen  -> "Q"
 | Rook   -> "R"
 | Bishop -> "B"
 | Knight -> "N"
 | Pawn   -> ""
