let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start

let time_average f n =
  let rec loop i acc = if i < n then loop (succ i) (time f +. acc) else acc in
  loop 1 (float_of_int 0) /. float_of_int n
