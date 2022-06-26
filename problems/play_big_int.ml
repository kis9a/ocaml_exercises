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
let ( >~ ) = Big_int.gt_big_int ;;

Printf.printf "%b\n" (Big_int.zero_big_int <~ Big_int.zero_big_int) ;;
Printf.printf "%b\n" (Big_int.zero_big_int =~ Big_int.zero_big_int) ;;
Printf.printf "%b\n" (Big_int.zero_big_int <=~ Big_int.zero_big_int) ;;
Printf.printf "%b\n" (Big_int.zero_big_int >=~ Big_int.zero_big_int)
