let rec range i j = if i > j then [] else i :: (range (i + 1) j)

let reverse_string s =
  let l = String.length s in
  let r = Bytes.create l in
  let last = l - 1 in
  for i = 0 to last do
    Bytes.unsafe_set r (last - i) (String.unsafe_get s i)
  done;
  Bytes.unsafe_to_string r

let products = List.concat (List.map (fun x -> List.map (fun y -> x * y) (range 100 999)) (range 1 999))

let palindromes = List.filter (fun x -> (string_of_int x) = (reverse_string (string_of_int x))) products;;

Printf.printf "%d\n" (List.fold_left max (List.hd palindromes) palindromes)
