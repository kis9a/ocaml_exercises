let abc085_b lst =
  let rec uniq_list lst =
    match lst with
    | [] -> []
    | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)
  in
  List.length (uniq_list lst)
;;

Printf.printf "%d\n" (abc085_b [8; 10; 6; 8])
