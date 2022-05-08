let concat a b = a ^ b

let rec join ?(d = ",") list =
  match list with [] -> "" | [a] -> a | a :: b -> a ^ d ^ join b
