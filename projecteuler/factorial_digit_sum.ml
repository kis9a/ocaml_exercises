#load "nums.cma"

let factorial_digit_sum n =
  let rec sum_list lst = match lst with [] -> 0 | a :: b -> a + sum_list b in
  let digits_by_split str d =
    let rec split sn acc =
      match sn with
      | sn ->
          if sn = String.length str then acc
          else
            split
              (sn + d)
              (List.append acc [int_of_string (String.sub str sn d)])
    in
    split 0 []
  in
  let rec factorial_big_int n acc =
    if n = 0 then acc
    else
      factorial_big_int
        (pred n)
        (Big_int.mult_big_int (Big_int.big_int_of_int n) acc)
  in
  sum_list
    (digits_by_split
       (Big_int.string_of_big_int (factorial_big_int n Big_int.unit_big_int))
       1)
;;

Printf.printf "%d" (factorial_digit_sum 100)
