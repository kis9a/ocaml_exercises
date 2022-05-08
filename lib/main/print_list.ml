let rec print_list = function
  | [] -> ()
  | e :: l ->
      print_int e ;
      print_string " " ;
      print_list l
