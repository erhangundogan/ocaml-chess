let of_string = function
  | "" -> false
  | _  -> true

let to_notation = function
  | true  -> "x"
  | false -> ""

let to_string = function
  | true  -> "yes"
  | false -> ""
