(* Module interface AKA signature (?) *)

val hello : unit -> unit
val goodbye : unit -> unit
(* Formalities *)

type date
(* "Abstract type": Define a type in amodule.ml but just provide the name here *)
val create : day:int -> month:int -> year:int -> unit -> date
val sub : date -> date -> date
val years : date -> float

module Hello :
sig
  val hello : unit -> unit
end

module type X_int = sig val x : int end
module Three : sig val x : int val y : int end
module Increment :
  functor (M : X_int) -> X_int

val lwty : int Lwt.t