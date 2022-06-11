let rec print_list = function
  | [] -> ()
  | e :: l ->
      print_int e ;
      print_string " " ;
      print_list l

let is_prime n =
  let rec loop i =
    if i < n then if n mod i = 0 then false else loop (i + 1) else true
  in
  loop 2

let rec max_list list =
  match list with
  | [] -> raise (Failure "List is empty")
  | [a] -> a
  | [a; b] -> if a > b then a else b
  | a :: b :: c -> if a > b then max_list (a :: c) else max_list (b :: c)

let rec uniq_list lst =
  match lst with
  | [] -> []
  | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)

let smallest_multiple n =
  let rec filter lst ns acc =
    match lst with
    | [] -> acc
    | a :: b ->
        let rec divisors lstn accn =
          match lstn with
          | [] -> accn
          | an :: bn ->
              if an > a && an mod a = 0 then divisors bn (List.append accn [an])
              else divisors bn accn
        in
        let is_empty n = match n with [] -> true | _ :: _ -> false in
        let d = divisors ns [] in
        if is_empty d then filter b ns acc
        else filter b ns (List.append acc [max_list d])
  in
  let rec product_of_int_list lst acc =
    match lst with [] -> acc | a :: b -> product_of_int_list b (a * acc)
  in
  let ns n =
    let rec loop i = if i > 0 then i :: loop (i - 1) else [] in
    loop n
  in
  let numbers = ns n in
  let filters = filter numbers numbers [] in
  let primes =
    List.find_all
      (function x -> not (List.exists (function y -> y mod x = 0) filters))
      (List.find_all (function x -> is_prime x) numbers)
  in
  Printf.printf "\n" ;
  print_list (List.find_all (function x -> is_prime x) numbers) ;
  Printf.printf "\n" ;
  product_of_int_list (List.find_all (function x -> is_prime x) numbers) 1

let rec gcd a b = if b = 0 then a else gcd b (a mod b) ;;

Printf.printf "%d" (gcd 21 6) ;;
Printf.printf "%d" (smallest_multiple 10) ;;
Printf.printf "%b" (smallest_multiple 10 = 2520)
