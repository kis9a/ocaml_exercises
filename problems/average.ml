let average xs = Array.fold_left ( +. ) 0.0 xs /. float_of_int (Array.length xs)
;;

Printf.printf "%f\n" (average [| 8.0; 2.0; 5.0 |])
