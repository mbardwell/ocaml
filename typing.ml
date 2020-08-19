open Printf

(* variants *)
type animal = Horse | Sheep | Human

type farm = House | Barn | Field

(* notice how Human has to have a type (animal in this instance) *)
let get = function
  | Human, (Barn | Field) -> printf "Tired\n"
  | (Horse | Sheep), House -> printf "Bad\n"
  | _ -> printf "Unremarkable\n"
let () = get (Human, Field)  (* Tired *)

type location = { animal : animal ; farm : farm }
let current = { animal = Horse; farm = Barn }
let () = get (current.animal, current.farm)  (* Unremarkable *)

(* polymorphic variants
notice how `Human does not has to have a type *)
let get_2 = function
  | `Human, (`Barn | `Field) -> printf "Tired\n"
  | (`Horse | `Sheep), `House -> printf "Bad\n"
  | _ -> printf "Unremarkable\n"

let () = get_2 (`Horse, `Barn)  (* unremarkable *)