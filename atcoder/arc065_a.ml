let arc065_a s =
  let lst = ["dream"; "dreamer"; "erase"; "eraser"] in
  let rev_string s =
    let rec loop n =
      match n with
      | 0 -> Char.escaped s.[0]
      | _ -> Char.escaped s.[n] ^ loop (n - 1) in
    loop (String.length s - 1) in
  let lst_hd n = match n with [] -> None | x :: _ -> Some x in
  let rev_map_strings = List.map (fun x -> rev_string x) lst in
  let rec loop s =
    match s with
    | "" -> "YES"
    | s -> (
        let r =
          List.filter
            (fun x -> x <> 0)
            (List.map
               (fun ds ->
                 let dsl = String.length ds in
                 let sl = String.length s in
                 if dsl > sl then 0
                 else
                   let ns = String.sub s 0 dsl in
                   if ds = ns then dsl else 0 )
               rev_map_strings ) in
        match lst_hd r with
        | None -> "NO"
        | Some x -> loop (String.sub s x (String.length s - x)) ) in
  match s with "" -> "NO" | s -> loop (rev_string s)
;;

Printf.printf "%s\n" (arc065_a "dreameraserdream") ;;
Printf.printf "%s\n" (arc065_a "dreameraserdrm")
