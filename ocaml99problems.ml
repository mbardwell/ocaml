(* 1. Write a function last : 'a list -> 'a option that returns the last element of a list. (easy) *)

let rec last = function
  | [] -> None
  | [t] -> Some t
  | _::t -> last t

(* From https://discuss.ocaml.org/t/how-does-one-print-any-type/4362/2 - usually the dev includes a print formatter*)
let last_pp ppf number = 
  let int_of_int_option = function
  | None -> 0
  | Some n -> n in
  Format.fprintf ppf "%d" @@ int_of_int_option number

let () = Format.printf "Printing last %a\n" last_pp @@ last [1;2;3]
