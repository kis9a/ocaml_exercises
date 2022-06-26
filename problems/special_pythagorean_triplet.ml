(* let triplet a b = match a with a | a -> when a = 0 -> 0 *)

let special_pythagorean_triplet n =
  let rec loop_a a =
    match a with a when a >= n / 3 -> false | a -> loop_b a 0 false
  and loop_b a b acc =
    match b with
    | b when b >= n / 2 -> loop_a (succ a)
    | b ->
        let c = n - a - b in
        if (a * a) + (b * b) = c * c then (
          Printf.printf "a: %d b: %d c: %d\n" a b c ;
          true)
        else loop_b a (succ b) false
  in
  loop_a 0
;;

Printf.printf "%b\n" (special_pythagorean_triplet 12) ;;
Printf.printf "%b\n" (special_pythagorean_triplet 1000)
