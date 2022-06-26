let input_one_line fin =
  try Some (input_line fin)
  with End_of_file ->
    close_in fin ;
    None

let rec flush_file fin =
  match input_one_line fin with
  | None -> ()
  | Some x ->
      print_endline x ;
      flush_file fin

let paste_file file1 file2 =
  let fin1 = open_in file1 in
  let fin2 = open_in file2 in
  let rec paste_sub () =
    let buff1 = input_one_line fin1 in
    let buff2 = input_one_line fin2 in
    match (buff1, buff2) with
    | None, None -> ()
    | Some x, None ->
        print_endline x ;
        flush_file fin1
    | None, Some x ->
        print_endline x ;
        flush_file fin2
    | Some x, Some y ->
        print_string x ;
        print_endline y ;
        paste_sub ()
  in
  paste_sub ()
;;

paste_file "/Users/kis9a/dev/adf/filesplit.ml" "/Users/kis9a/dev/adf/tail.ml"
