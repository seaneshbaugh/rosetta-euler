let rec range i j = if i > j then [] else i :: (range (i + 1) j);;

Printf.printf "%d\n" ((int_of_float ((float_of_int (List.fold_left (fun acc x -> acc + x) 0 (range 1 100))) ** 2.0)) - (List.fold_left (fun acc x -> acc + (x * x)) 0 (range 1 100)))
