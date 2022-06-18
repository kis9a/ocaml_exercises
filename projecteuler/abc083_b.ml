let rec abc083_b n an bn =
  let rec sum_digits str acc =
    match str with
    | s when s = "" -> acc
    | s ->
        sum_digits (String.sub str 1 (String.length str - 1)) acc
        + int_of_string (String.sub str 0 1)
  in
  let ns n =
    let rec loop i = if i > 0 then i :: loop (i - 1) else [] in
    loop n
  in
  let rec sum lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        let d = sum_digits (string_of_int a) 0 in
        if an <= d && d <= bn then sum b (acc + a) else sum b acc
  in
  sum (ns n) 0
;;

Printf.printf "%d\n" (abc083_b 20 2 5) ;;
Printf.printf "%d\n" (abc083_b 100 4 16)
