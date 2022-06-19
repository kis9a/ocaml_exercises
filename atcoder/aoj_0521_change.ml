let aoj_0521_change n lst =
  let sd lst = List.sort (fun x y -> if x > y then -1 else 1) lst in
  let rec loop n lst acc =
    match lst with
    | [] -> raise (Failure "unexpected")
    | [a] -> acc + n
    | a :: b ->
        let ne = n / a in
        let nn = n mod a in
        if nn = 0 then acc + ne else loop nn b (acc + ne) in
  loop n (sd lst) 0

let ou = [500; 50; 100; 10; 5; 1] ;;

Printf.printf "%d\n" (aoj_0521_change 951 ou) ;;
Printf.printf "%d\n" (aoj_0521_change 5 ou) ;;
Printf.printf "%d\n" (aoj_0521_change 1000 ou)
