type t = {
  piece: Piece.t;
  move_from: (char option * int option);
  capture: bool;
  move_to: (char * int);
  promotion: Piece.t option;
  en_passant: bool
}

let create ~piece ~move_from ~capture ~move_to ~promotion ~en_passant =
  { piece; move_from; capture; move_to; promotion; en_passant }
