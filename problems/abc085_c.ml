let ac = 10000
let bc = 5000
let cc = 1000

let abc085_c y n =
  let ns i =
    let rec loop i = if i <= n then i :: loop (succ i) else [] in
    loop i
  in
  let nlst = ns 0 in
  let rec loop lst acc =
    match lst with
    | [] -> [-1; -1; -1]
    | a :: b ->
        let next l2 = match acc with [] -> loop b l2 | a -> a in
        next (loop2 a nlst)
  and loop2 an lst =
    match lst with
    | [] -> []
    | a :: b ->
        let cn = n - an + a in
        let total = (ac * an) + (bc * a) + (cc * cn) in
        if cn > 0 && total = y then loop lst [an; a; cn] else loop2 an b
  in
  loop nlst []

let rec print_int_list = function
  | [] -> ()
  | a :: b ->
      print_int a ;
      print_string " " ;
      print_int_list b
;;

let e1 = abc085_c 45000 9 in
print_int_list e1 ;
Printf.printf "\n" ;
Printf.printf
  "%d\n"
  ((ac * List.nth e1 0) + (bc * List.nth e1 1) + (cc * List.nth e1 2))
;;

let e2 = abc085_c 196000 20 in
print_int_list e2 ;
Printf.printf "\n" ;
Printf.printf
  "%d\n"
  ((ac * List.nth e2 0) + (bc * List.nth e2 1) + (cc * List.nth e2 2))
;;

let e3 = abc085_c 1234000 1000 in
print_int_list e3 ;
Printf.printf "\n" ;
Printf.printf
  "%d\n"
  ((ac * List.nth e3 0) + (bc * List.nth e3 1) + (cc * List.nth e3 2))
;;

let e4 = abc085_c 20000000 2000 in
print_int_list e4 ;
Printf.printf "\n" ;
Printf.printf
  "%d\n"
  ((ac * List.nth e4 0) + (bc * List.nth e4 1) + (cc * List.nth e4 2))
