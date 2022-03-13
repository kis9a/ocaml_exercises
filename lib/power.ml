let rec power (x, y) = if y = 0 then 1.0 else x *. power (x, y - 1)

let rec power2 (x, y) =
  if y = 0 then 1.0
  else
    let z = power2 (x, y / 2) in
    let zz = z *. z in
    if y mod 2 = 0 then zz else x *. zz
