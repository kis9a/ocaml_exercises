let rec label_arg ~first:a ~last:b =
  if a > b then [] else a :: label_arg ~first:(a + 1) ~last:b

let rec optional_arg ?(step = 1) a b =
  if a > b then [] else a :: optional_arg ~step (a + step) b
