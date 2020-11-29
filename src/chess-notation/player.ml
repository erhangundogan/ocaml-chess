type t = White | Black

let of_string = function
 | "White" -> White
 | "Black" -> Black
 | _ -> failwith "Invalid player string"

let to_string = function
 | White -> "White"
 | Black -> "Black"
