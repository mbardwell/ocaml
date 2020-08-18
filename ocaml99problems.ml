(* 1. Write a function last : 'a list -> 'a option that returns the last element of a list. (easy) *)

let rec last = function
  | [] -> None
  | [t] -> Some t
  | _::t -> last t

let int_of_int_option = function
  | None -> 0
  | Some n -> n

let () = Printf.printf "%d\n" @@ int_of_int_option @@ last [1;2;3]
