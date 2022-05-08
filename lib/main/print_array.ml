let print_int_array arr = arr |> Array.iter (fun x -> print_int x)
let print_uint_array arr = arr |> Array.iter (fun x -> print_endline x)
let print_unit_array_in_array arr = arr |> Array.iter (Array.iter print_endline)
