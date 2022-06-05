(* 1 *)
let rec tail lst =
  match lst with [] -> None | [x] -> Some x | _ :: x -> tail x

let rec tail_function = function
  | [] -> None
  | [x] -> Some x
  | _ :: x -> tail_function x

(* 2 *)
let rec tail_2 lst =
  match lst with
  | [] -> None
  | [_] -> None
  | [x; y] -> Some (x, y)
  | _ :: x :: y -> tail_2 (x :: y)

let rec tail_2_function = function
  | [] -> None
  | [_] -> None
  | [x; y] -> Some (x, y)
  | _ :: x -> tail_2_function x
