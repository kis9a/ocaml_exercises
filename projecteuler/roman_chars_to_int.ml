let roman_chars =
  [('I', 1); ('V', 5); ('X', 10); ('L', 50); ('C', 100); ('D', 500); ('M', 1000)]

let roman_to_num roman =
  let num = ref 0 in
  let prev = ref 'I' in
  try
    for i = 0 to String.length roman - 1 do
      if i = 0 then (
        num := !num + List.assoc roman.[i] roman_chars ;
        prev := roman.[i])
      else
        let p = List.assoc !prev roman_chars
        and c = List.assoc roman.[i] roman_chars in
        if p >= c then num := !num + c else num := !num - (p * 2) + c ;
        prev := roman.[i]
    done ;
    !num
  with Not_found ->
    Printf.printf "  convert (%d) %s\n%!" !num roman ;
    !num
;;

Printf.printf "%d" (roman_to_num "IV")
