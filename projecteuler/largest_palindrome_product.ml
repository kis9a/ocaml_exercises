let combination_of_x_selection_from_n n x =
  let rec factorial_n_to_x n x =
    if n < x then 1 else n * factorial_n_to_x (n - 1) x
  in
  factorial_n_to_x n (n - x + 1) / factorial_n_to_x x 1
;;

Printf.printf "%d\n" (combination_of_x_selection_from_n 999 2)

let repeated_combination n x =
  combination_of_x_selection_from_n n x
  * combination_of_x_selection_from_n (n - x) x
  / x
;;

Printf.printf "%d\n" (repeated_combination 9 2) ;;
Printf.printf "%d\n" (repeated_combination 9 3)

let rec is_palindrome s =
  if String.length s <= 1 then true
  else if s.[0] = s.[String.length s - 1] then
    is_palindrome (String.sub s 1 (String.length s - 2))
  else false

let find_largest_palindrome n x =
  let rec loop nl acc = if nl > 0 then loop2 nl x acc else acc
  and loop2 nl xl acc =
    if xl > 0 then
      let prod = nl * xl in
      if is_palindrome (string_of_int prod) then loop (pred nl) (max prod acc)
      else loop2 nl (pred xl) acc
    else loop (pred nl) acc
  in
  loop n 0
;;

Printf.printf "%d\n" (find_largest_palindrome 999 999)
