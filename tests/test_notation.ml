open Chess_notation

module To_test = struct
  let read_notation = Main.read_notation
end

let notation = Alcotest.testable Main.pp Main.equal

let read_castling1 () =
  Alcotest.check notation "same notation"
    (Player.White, None, Some { king_side = true; queen_side = false }, None)
    (To_test.read_notation "0-0")

let read_castling2 () =
  Alcotest.check notation "same notation"
    (Player.White, None, Some { king_side = false; queen_side = true }, Some { check = true; check_mate = false})
    (To_test.read_notation "0-0-0+")

let read_castling3 () =
  Alcotest.check notation "same notation"
    (Player.Black, None, Some { king_side = true; queen_side = false }, Some { check = false; check_mate = true})
    (To_test.read_notation ~player:Player.Black "0-0#")

let read_movement1 () =
  Alcotest.check notation "same notation"
    (Player.White, Some {
      piece = Piece.Pawn;
      move_from = (None, None);
      capture = false;
      move_to = ('d', 5);
      promotion = None;
      en_passant = false
    }, None, None)
    (To_test.read_notation "d5")

let read_movement2 () =
  Alcotest.check notation "same notation"
    (Player.Black, Some {
      piece = Piece.Pawn;
      move_from = (Some 'c', None);
      capture = true;
      move_to = ('d', 4);
      promotion = None;
      en_passant = false
    }, None, None)
    (To_test.read_notation ~player:Player.Black "cxd4")

let read_movement3 () =
  Alcotest.check notation "same notation"
    (Player.White, Some {
      piece = Piece.Pawn;
      move_from = (Some 'e', None);
      capture = true;
      move_to = ('d', 6);
      promotion = None;
      en_passant = true
    }, None, None)
    (To_test.read_notation "exd6e.p.")

let read_movement4 () =
  Alcotest.check notation "same notation"
    (Player.Black, Some {
      piece = Piece.Knight;
      move_from = (None, None);
      capture = false;
      move_to = ('f', 3);
      promotion = None;
      en_passant = false
    }, None, None)
    (To_test.read_notation ~player:Player.Black "Nf3")

let read_movement5 () =
  Alcotest.check notation "same notation"
    (Player.Black, Some {
      piece = Piece.Queen;
      move_from = (None, None);
      capture = false;
      move_to = ('h', 4);
      promotion = None;
      en_passant = false
    }, None, Some { check = false; check_mate = true })
    (To_test.read_notation ~player:Player.Black "Qh4#")

let read_movement6 () =
  Alcotest.check notation "same notation"
    (Player.White, Some {
      piece = Piece.Pawn;
      move_from = (Some 'c', None);
      capture = true;
      move_to = ('d', 8);
      promotion = Some Queen;
      en_passant = false
    }, None, Some { check = true; check_mate = false })
    (To_test.read_notation "cxd8Q+")

let () =
  let open Alcotest in
  run "Chess_notation" [
    "castling", [
      test_case "white king-side castling" `Quick read_castling1;
      test_case "white queen-side castling check" `Quick read_castling2;
      test_case "black king-side castling checkmate" `Quick read_castling3;
    ];
    "movement", [
      test_case "white pawn movement" `Quick read_movement1;
      test_case "black pawn capture movement" `Quick read_movement2;
      test_case "white pawn en passant" `Quick read_movement3;
      test_case "black knight movement" `Quick read_movement4;
      test_case "fool's mate last movement" `Quick read_movement5;
      test_case "white capture, promote to queen and check" `Quick read_movement6;
    ]
  ]
