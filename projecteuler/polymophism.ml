let store = ref None
let another_store = ref None ;;

another_store := Some 0

let swap store x =
  match !store with
  | None ->
      store := Some x ;
      x
  | Some y ->
      store := Some x ;
      y

(* val swap : 'a option ref -> 'a -> 'a = <fun> *)

let one = swap store 1
let one_again = swap store 2
let two = swap store 3
let error = swap store (fun x -> x) ;;

store := Some (fun x -> x)

let option_ref = ref None
let option_ref : int option ref = ref None

(* Error: This expression should not be a function, the expected type is int *)
(* val one : int = 1 val one_again : int = 1 val two : int = 2 *)
