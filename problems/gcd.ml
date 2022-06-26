let rec gcd a b = if b = 0 then a else gcd b (a mod b) ;;

Printf.printf "%d\n" (gcd 12 17) ;;
Printf.printf "%d\n" (gcd 12 18)
