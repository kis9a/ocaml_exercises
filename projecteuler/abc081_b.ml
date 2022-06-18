let abc081_b lst =
  let rec loop lst acc =
    if List.exists (fun x -> x mod 2 <> 0) lst then acc
    else loop (List.map (fun x -> x / 2) lst) (succ acc)
  in
  loop lst 0
;;

Printf.printf "%d\n" (abc081_b [16; 12; 24])
