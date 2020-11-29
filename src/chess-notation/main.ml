type t = (Player.t * Movement.t option * Castling.t option * Check_mate.t option)

let src = Logs.Src.create "notation" ~doc:"Chess notations"
module Log = (val Logs.src_log src : Logs.LOG)

let regexp_string str =
  "^([NBRQKS])?([a-h]|[1-8]|[a-h][1-8])?([x\\:])?([a-h][1-8])(=?[NBRQKS]|e\\.p\\.)?([#\\+])?$|^(0-0|0-0-0)([#\\+])?$"
  |> Re.Pcre.regexp
  |> (fun regexp -> Re.all regexp str)
  |> (fun group_list ->
    begin match List.length group_list with
    | 0 -> [||]
    | _ -> List.hd group_list |> Re.Group.all
    end)

let read_groups_array ~player arr =
  begin match arr with
  | [|_;_;_;_;_;_;_;"0-0"|"0-0-0";cm|] ->
    (player,
     None,
     Some (Castling.of_string arr.(7)),
     (Check_mate.of_string cm))
  | [|_;p;mx;c;d;pep;cm;_;_|] ->
    let piece = Piece.of_notation p in
    let move_from = Move_from.of_string mx in
    let capture = Capture.of_string c in
    let move_to = Move_to.of_string d in
    let en_passant = En_passant.of_string pep in
    let promotion = Promotion.of_string pep in
    (player,
     Some (Movement.create ~piece ~move_from ~capture ~move_to ~en_passant ~promotion),
     None,
     (Check_mate.of_string cm))
  | _ -> failwith "wrong movement"
  end

let read_notation ?(player=Player.White) str =
  let re_groups_array = regexp_string str in
  if (Array.length re_groups_array) <> 9
  then (player, None, None, None)
  else read_groups_array re_groups_array ~player

let pp ppf (_, _m, c, cm) =
  begin match (_m, c) with
  | Some m, None ->
    Fmt.pf ppf "@[Piece  | Move from | Capture | Move to | Promotion | En passant | Check/Mate@.\
       %-6s | %-9s | %-7s | %-7s | %-9s | %-10s | %-10s@."
      (Piece.to_string m.Movement.piece)
      (Move_from.to_string m.move_from)
      (Capture.to_string m.capture)
      (Move_to.to_string m.move_to)
      (Promotion.to_string m.promotion)
      (En_passant.to_string m.en_passant)
      (Check_mate.to_string cm)
  | None, Some c ->
    Fmt.pf ppf "@[Castling   | Check/Mate@.%-8s | %-10s@."
      (Castling.to_string c)
      (Check_mate.to_string cm)
  | _ -> failwith "wrong move"
  end

let equal x y = (x = y)

