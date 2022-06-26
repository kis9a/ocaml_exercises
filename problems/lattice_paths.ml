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

let lattice_paths n =
  let c n x =
    let rec f n x =
      if n <~ x then Big_int.big_int_of_int 1
      else n *~ f (n -~ Big_int.big_int_of_int 1) x
    in
    f n (n -~ x +~ Big_int.big_int_of_int 1) /~ f x (Big_int.big_int_of_int 1)
  in
  c (Big_int.big_int_of_int 2 *~ n) n
;;

Printf.printf
  "%s"
  (Big_int.string_of_big_int (lattice_paths (Big_int.big_int_of_int 20)))
