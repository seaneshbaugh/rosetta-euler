let fibs_less_than x =
  let rec f l =
    match l with
    | hd::tl when hd + (List.hd tl) < x -> f ([hd + (List.hd tl)] @ l)
    | _ -> l
  in
  f [1; 0];;

Printf.printf "%d\n" (List.fold_left (+) 0 (List.filter (fun x -> (x mod 2) = 0) (fibs_less_than 4000000)))
