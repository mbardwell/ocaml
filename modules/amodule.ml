(* Related to amodule.mli and bmodule.ml 

sources: 
  https://dev.realworldocaml.org/
  https://caml.inria.fr/pub/docs/manual-ocaml/
*)


(* Interfaces and signature *)
let message = "Hello"
let hello () = print_endline message
let goodbyemsg = "Goodbye"
let goodbye () = print_endline goodbyemsg

(* Abstract types *)
type date = { day : int; month : int; year : int}
let create ~day:d ~month:m ~year:y () = { day = d; month = m; year = y }
let sub date1 date2 = { day = (date2.day - date1.day); month = 1; year = 2020}
let years date = float_of_int date.year

(* Submodule implementation *)
module Hello = struct
  let message = "Hello"
  let hello () = print_endline message
end

(* Functor *)
module type X_int = sig val x : int end
module Increment (M : X_int) : X_int = struct
  let x = M.x + 1
end
module Three = struct let x = 3 let y = 4 end
  (* using functors *)
module Four = Increment(Three)
module Int_set = Set.Make (struct type t = int let compare = compare end)

(* Advanced functor https://dev.realworldocaml.org/functors.html *)
module type Comparable = 
sig
  type t
  val compare : t -> t -> int (* 0 if x=y, + if x>y, - if x<y *)
end
module Make_interval (Endpoint : Comparable) =
struct
  type t = Interval of Endpoint.t * Endpoint.t | Empty
  let create low high =
    if Endpoint.compare low high > 0 then Empty
    else Interval (low, high)

  let is_empty = function
  | Empty -> true
  | Interval _ -> false

  let contains t x =
    match t with
    | Empty -> false
    | Interval (l, h) -> if l < x && x < h then true else false
end
module Int_interval = Make_interval (struct type t = int let compare = Base.Int.compare end)
let my_interval = Int_interval.create 3 8
let _ = Int_interval.is_empty my_interval
let () = Printf.printf "%s\n" @@ string_of_bool @@ Int_interval.contains my_interval 2 (* false *)
let () = Printf.printf "%s\n" @@ string_of_bool @@ Int_interval.contains my_interval 5 (* true *)

(* references *)
let y x = x := !x + 1
let a = ref 1
let () = y a
let () = Printf.eprintf "%d\n" !a

(* lwt *)
open Lwt
let get_input = int_of_string

let x =
  let a = get_input "1" in
  let b = get_input "2" in
  a + b

let y =
  get_input "1" |> fun a ->
  get_input "2" |> fun b ->
  a + b

let lwty =
  return @@ get_input "1" >>= fun a ->
  return @@ get_input "2" >>= fun b ->
  Lwt.return (x + y)

let () = print_endline @@ string_of_int x
let () = print_endline @@ string_of_int @@ Lwt_main.run lwty
(* Lwt_main is a part of cohttp-lwt-unix *)
