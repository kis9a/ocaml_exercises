let lcm a b =
  let rec gcd a b = if b = 0 then a else gcd b (a mod b) in
  a * b / gcd a b
;;

Printf.printf "%d\n" (lcm 12 17) ;;
Printf.printf "%d\n" (lcm 12 18)
