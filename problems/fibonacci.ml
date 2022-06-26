let fibonacci (n : int) =
  let rec loop a b acc =
    let nv = a + b in
    if acc >= n then nv else loop b nv (succ acc)
  in
  loop 0 1 2

let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start

let time_average f n =
  let rec loop i acc = if i < n then loop (succ i) (time f +. acc) else acc in
  loop 1 (float_of_int 0) /. float_of_int n
;;

Printf.printf "%d\n" (fibonacci 100)
