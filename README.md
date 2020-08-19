# Learn OCaml

1. download opam and prepare ocaml

It looks something like (I recommend you visit the download-opam website though)

```
engi@engi-Aspire-R7-371T:~$ sudo sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
engi@engi-Aspire-R7-371T:~$ opam init
```  
say yes to any prompts.

When you are done you should see something like

```bash
engi@engi-Aspire-R7-371T:~/Documents/ocaml-example$ opam --version
2.0.7
engi@engi-Aspire-R7-371T:~/Documents/ocaml-example$ ocaml --version
The OCaml toplevel, version 4.08.1
```

Let's set up a new switch "which are independent installation prefixes with their own compiler and sets of installed and pinned packages". 
Again, say yes to any prompts.

```bash
engi@engi-Aspire-R7-371T:~$ opam switch create 4.10.0  # you can opam switch list-available to get the most recent version
engi@engi-Aspire-R7-371T:~$ ocaml --version
The OCaml toplevel, version 4.10.0
engi@engi-Aspire-R7-371T:~$ opam --version
2.0.7
```

and then install the most recent `utop`, the "Universal toplevel (interactive console) for OCaml", for your new switch.
`utop` is much better than the default `ocaml` toplevel.
```
engi@engi-Aspire-R7-371T:~$ opam install utop
engi@engi-Aspire-R7-371T:~$ utop -version
The universal toplevel for OCaml, version 2.5.0, compiled for OCaml version 4.10.0
```

Check to make sure this works
```
engi@engi-Aspire-R7-371T:~$ utop
─( 12:28:02 )─< command 0 >───────────────────────────────────{ counter: 0 }─
utop # #require "lwt.unix";;
─( 12:28:02 )─< command 1 >───────────────────────────────────{ counter: 0 }─
utop # Lwt_io.read_char;;
- : Lwt_io.input_channel -> char Lwt.t = <fun>
```

Great! You are ready to learn OCaml