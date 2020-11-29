let of_string = function
  | "e.p." -> true
  | _ -> false

let to_notation = function
  | true -> "e.p."
  | false -> ""

let to_string = function
  | true -> "yes"
  | false -> ""
