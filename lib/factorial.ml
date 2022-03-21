(* if then *)
let rec factorial n = if n <= 1 then 1 else n * factorial (n - 1)

(* pattern maching *)
let rec factorial2 n =
  match n with _ when n <= 1 -> 1 | n -> n * factorial2 (n - 1)
