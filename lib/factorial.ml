(* if then *)
let rec factorial n = if n = 0 then 1 else n * factorial (n - 1)

(* pattern maching *)
let rec factorial2 n = match n with 0 -> 1 | n' -> n' * factorial2 (n' - 1)
