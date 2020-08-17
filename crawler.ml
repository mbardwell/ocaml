(* client_example.ml *)
open Core
open Lwt
open Cohttp
open Cohttp_lwt_unix


let websites = "https://www.ghgsat.com"::"https://google.ca"::[]

let body url =
  Client.get (Uri.of_string url) >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  Printf.printf "Response code: %d\n" code;
  Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  body |> Cohttp_lwt.Body.to_string >|= fun body ->
  Printf.printf "Body of length: %d\n" (String.length body);
  body;;

let head list = 
  match list with
  | h::_ -> body h
  | _ -> body "https://reddit.com/";;

let () =
  let body = Lwt_main.run @@ head websites in
  print_endline ("Received body\n" ^ body)
