let head_file filename =
  let fin = open_in filename in
  let head_file_sub () =
    for i = 1 to 10 do
      print_endline (input_line fin)
    done ;
    close_in fin
  in
  try head_file_sub () with End_of_file -> close_in fin
;;

head_file "/Users/kis9a/dev/adf/head.ml"

let tail_file file =
  let fin = open_in file in
  let buff = ref [] in
  let rec tail_file_sub () =
    let xs = input_line fin in
    if List.length !buff < 10 then buff := !buff @ [xs]
    else buff := List.tl !buff @ [xs] ;
    tail_file_sub ()
  in
  try tail_file_sub ()
  with End_of_file ->
    close_in fin ;
    List.iter print_endline !buff
;;

tail_file "~/dev/adf/tail.ml"
