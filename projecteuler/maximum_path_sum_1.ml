let ns0 = [[3]; [7; 4]; [2; 4; 6]; [8; 5; 9; 3]]

let ns =
  [ [75];
    [95; 64];
    [17; 47; 82];
    [18; 35; 87; 10];
    [20; 04; 82; 47; 65];
    [19; 01; 23; 75; 03; 34];
    [88; 02; 77; 73; 07; 63; 67];
    [99; 65; 04; 28; 06; 16; 70; 92];
    [41; 41; 26; 56; 83; 40; 80; 70; 33];
    [41; 48; 72; 33; 47; 32; 37; 16; 94; 29];
    [53; 71; 44; 65; 25; 43; 91; 52; 97; 51; 14];
    [70; 11; 33; 28; 77; 73; 17; 78; 39; 68; 17; 57];
    [91; 71; 52; 38; 17; 14; 91; 43; 58; 50; 27; 29; 48];
    [63; 66; 04; 68; 89; 53; 67; 30; 73; 16; 69; 87; 40; 31];
    [04; 62; 98; 27; 23; 09; 70; 98; 73; 93; 38; 53; 60; 04; 23] ]

let nn = [1; 2; 4; 3; 5]

let maximum_path_sum_1 ns =
  let len = List.length ns in
  let rec max_of_row i j acc =
    match i with
    | i when i >= len -> acc
    | i ->
        let rns = List.nth ns i in
        let a = List.nth rns j in
        let b = if i <> 0 then List.nth rns (j + 1) else 0 in
        if a = b then
          max
            (max_of_row (succ i) j (acc + a))
            (max_of_row (succ i) (j + 1) (acc + b))
        else if a > b then (
          Printf.printf "%d\n" a ;
          max_of_row (succ i) j (acc + a))
        else (
          Printf.printf "%d\n" b ;
          max_of_row (succ i) (j + 1) (acc + b))
  in
  max_of_row 0 0 0
;;

(* Printf.printf "%d\n" (maximum_path_sum_1 ns0) *)
Printf.printf "%d\n" (maximum_path_sum_1 ns)
