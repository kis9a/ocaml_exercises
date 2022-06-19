#load "nums.cma"

let ( +~ ) = Big_int.add_big_int
let ( >=~ ) = Big_int.ge_big_int

let n_digit_fibonacci_number n t =
  let rec loop a b acc =
    let nv = a +~ b in
    if acc >=~ Big_int.big_int_of_int t then
      raise (Failure "finished with t times")
    else if String.length (Big_int.string_of_big_int nv) > n then acc
    else loop b nv (Big_int.succ_big_int acc)
  in
  loop
    Big_int.zero_big_int
    (Big_int.big_int_of_int 1)
    (Big_int.big_int_of_int 2)
;;

Printf.printf
  "%s\n"
  (Big_int.string_of_big_int (n_digit_fibonacci_number 1000 10000))
