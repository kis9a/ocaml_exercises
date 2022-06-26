#load "nums.cma"

let rec chain_count n =
  let is_even n = n mod 2 = 0 in
  let rec r rn c =
    match rn with
    | rn when rn = 1 -> c + 1
    | rn -> r (if is_even rn then rn / 2 else (3 * rn) + 1) (succ c)
  in
  r n 0

let rec max_chain_count_of_threshold n =
  let rec find_max i acc =
    match i with
    | i ->
        let c = chain_count i in
        if i >= n then if c > acc then i else acc
        else find_max (i + 1) (if c > acc then i else acc)
  in
  find_max 1 1
;;

Printf.printf "%d\n" (max_chain_count_of_threshold 28)

let ( *~ ) = Big_int.mult_big_int
let ( +~ ) = Big_int.add_big_int
let ( /~ ) = Big_int.div_big_int
let ( -~ ) = Big_int.sub_big_int
let ( ^~ ) = Big_int.mod_big_int
let ( =~ ) = Big_int.eq_big_int
let ( <~ ) = Big_int.lt_big_int
let ( <=~ ) = Big_int.le_big_int
let ( >=~ ) = Big_int.ge_big_int
let ( >~ ) = Big_int.gt_big_int

let rec chain_count_big_number n =
  let is_even n = n ^~ Big_int.big_int_of_int 2 =~ Big_int.zero_big_int in
  let rec r rn c =
    match rn with
    | rn when rn =~ Big_int.big_int_of_int 1 -> c +~ Big_int.big_int_of_int 1
    | rn ->
        r
          (if is_even rn then rn /~ Big_int.big_int_of_int 2
          else (Big_int.big_int_of_int 3 *~ rn) +~ Big_int.big_int_of_int 1)
          (c +~ Big_int.big_int_of_int 1)
  in
  r n Big_int.zero_big_int

let rec max_chain_count_of_threshold_big_number n =
  let rec find_max i acc =
    match i with
    | i ->
        let c = chain_count_big_number i in
        if i >=~ n then if c >~ acc then i else acc
        else
          find_max (i +~ Big_int.big_int_of_int 1) (if c >~ acc then i else acc)
  in
  find_max (Big_int.big_int_of_int 1) (Big_int.big_int_of_int 1)
;;

Printf.printf
  "%s\n"
  (Big_int.string_of_big_int
     (max_chain_count_of_threshold_big_number (Big_int.big_int_of_int 1000)))
