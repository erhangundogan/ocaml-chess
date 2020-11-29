type t = {
  check: bool;
  check_mate: bool
}

let create ~check ~check_mate = { check; check_mate }

let of_string cm =
  match cm with
  | "+" -> Some (create ~check:true ~check_mate:false)
  | "#" -> Some (create ~check:false ~check_mate:true)
  | _ -> None

let to_notation cm =
  begin match Option.is_some cm with
  | true ->
    let { check; check_mate } = Option.get cm in
    begin match check, check_mate with
    | false, false -> ""
    | true, false -> "+"
    | false, true -> "#"
    | _ -> failwith "wrong check_mate"
    end
  | false -> ""
  end

let to_string cm =
  begin match Option.is_some cm with
  | true ->
    let { check; check_mate } = Option.get cm in
    begin match check, check_mate with
    | false, false -> ""
    | true,  false -> "check"
    | false,  true -> "checkmate"
    | _ -> failwith "wrong check_mate"
    end
  | false -> ""
  end
