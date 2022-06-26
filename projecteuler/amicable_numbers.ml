let rec print_list = function
  | [] -> ()
  | e :: l ->
      print_int e ;
      print_string " " ;
      print_list l

let rec uniq_list lst =
  match lst with
  | [] -> []
  | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)

let rec power (x, y) = if y = 0 then 1 else x * power (x, y - 1)

let rec factor n =
  if n < 2 then []
  else if n mod 2 = 0 then 2 :: factor (n / 2)
  else if n mod 3 = 0 then 3 :: factor (n / 3)
  else
    let rec factor_gt d n =
      if n < d * d then [n]
      else if n mod d = 0 then d :: factor_gt d (n / d)
      else if n mod (d + 2) = 0 then (d + 2) :: factor_gt d (n / (d + 2))
      else factor_gt (d + 6) n
    in
    factor_gt 5 n

let distinct_prime_factors n = uniq_list (factor n)
let rec sum_list lst = match lst with [] -> 0 | a :: b -> a + sum_list b
let sum_of_distinct_prime_fanctors n = sum_list (distinct_prime_factors n) ;;

Printf.printf "%d\n" (sum_of_distinct_prime_fanctors 28)

let number_of_distinct_prime_fanctors n = List.length (distinct_prime_factors n)
;;

Printf.printf "%d\n" (number_of_distinct_prime_fanctors 28) ;;
print_list (distinct_prime_factors 1800) ;;
Printf.printf "\n\n"

let rec sum_of_divisors n =
  if n = 0 then 0
  else
    let lst = factor n in
    let rec rle lstn dividends divisors =
      match lstn with
      | [] -> dividends / divisors
      | a :: b ->
          rle
            b
            (dividends
            * (power (a, List.length (List.find_all (fun x -> x = a) lst) + 1)
              - 1))
            (divisors * (a - 1))
    in
    rle (uniq_list lst) 1 1 - n
;;

Printf.printf "%d\n" (sum_of_divisors 1800)

let amicable_numbers n =
  let rec amicable i acc =
    if i < n then
      let s = sum_of_divisors i in
      if s < n && s <> i then
        if i = sum_of_divisors s then amicable (succ i) (s :: acc)
        else amicable (succ i) acc
      else amicable (succ i) acc
    else acc
  in
  amicable 0 []

let sum_of_amicable_numbers lst = sum_list lst ;;

Printf.printf "%d\n" (sum_of_amicable_numbers (amicable_numbers 300)) ;;
Printf.printf "%d\n" (sum_of_amicable_numbers (amicable_numbers 10000))
