let rec print_list = function
  | [] -> ()
  | x :: xs ->
      Printf.printf "%s " x ;
      print_list xs

let rec fizzbuzz ret n = function
  | x when x > n -> List.rev ret
  | x when x mod 3 = 0 && x mod 5 = 0 -> fizzbuzz ("FizzBuzz" :: ret) n (x + 1)
  | x when x mod 3 = 0 -> fizzbuzz ("Fizz" :: ret) n (x + 1)
  | x when x mod 5 = 0 -> fizzbuzz ("Buzz" :: ret) n (x + 1)
  | x -> fizzbuzz (string_of_int x :: ret) n (x + 1)
;;

print_list (fizzbuzz [] 100 1)

let rec fizzbuzz_2 ret = function
  | x when x = 0 -> ret
  | x when x mod 3 = 0 && x mod 5 = 0 -> fizzbuzz_2 ("FizzBuzz" :: ret) (x - 1)
  | x when x mod 3 = 0 -> fizzbuzz_2 ("Fizz" :: ret) (x - 1)
  | x when x mod 5 = 0 -> fizzbuzz_2 ("Buzz" :: ret) (x - 1)
  | x -> fizzbuzz_2 (string_of_int x :: ret) (x - 1)
;;

print_list (fizzbuzz_2 [] 100)
