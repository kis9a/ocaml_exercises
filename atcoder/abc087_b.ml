let ac = 500
let bc = 100
let cc = 50

let abc087_b x n =
  let ns n =
    let rec loop i = if i >= 0 then i :: loop (i - 1) else [] in
    loop n
  in
  let nlst = ns n in
  let rec loop lst acc =
    match lst with [] -> acc | a :: b -> loop b (loop2 a nlst acc)
  and loop2 an lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        let r = x - ((ac * an) + (bc * a)) in
        if r >= 0 && r mod cc = 0 then loop2 an b (succ acc) else loop2 an b acc
  in
  loop nlst 0
;;

Printf.printf "%d\n" (abc087_b 100 50)
