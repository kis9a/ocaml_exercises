#load "nums.cma"

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

let summation_of_primes_big_int n =
  let is_prime_big_int n =
    match n with
    | n when n <~ Big_int.zero_big_int -> raise (Failure "Not nature")
    | n when n =~ Big_int.big_int_of_int 1 -> false
    | n when n =~ Big_int.big_int_of_int 2 -> true
    | n when n ^~ Big_int.big_int_of_int 2 =~ Big_int.zero_big_int -> false
    | n ->
        let s =
          Big_int.big_int_of_int
            (int_of_float (sqrt (float_of_int (Big_int.int_of_big_int n))))
        in
        let rec r i acc =
          if i <=~ s then
            if n ^~ i =~ Big_int.zero_big_int then false
            else r (i +~ Big_int.big_int_of_int 2) true
          else true
        in
        r (Big_int.big_int_of_int 3) true
  in
  let rec sum_list lst =
    match lst with [] -> Big_int.zero_big_int | a :: b -> a +~ sum_list b
  in
  let ns n =
    let rec loop i =
      if i >~ Big_int.zero_big_int then
        if is_prime_big_int i then i :: loop (i -~ Big_int.big_int_of_int 1)
        else loop (i -~ Big_int.big_int_of_int 1)
      else []
    in
    loop n
  in
  sum_list (ns n)
;;

Printf.printf
  "%s\n"
  (Big_int.string_of_big_int
     (summation_of_primes_big_int (Big_int.big_int_of_int 2000000)))

let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start
;;

Printf.printf
  "%f"
  (time (fun x -> summation_of_primes_big_int (Big_int.big_int_of_int 2000000)))
