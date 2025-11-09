open Godoogle

let usage_msg = "For help :: godoogle --help"

let user_flags = ref []

let flags flag =
  user_flags := flag :: !user_flags

let speclist =
  [("--help", Arg.Set Cmd.help_flag, "Prints help message");
   ("--query", Arg.Set_string Cmd.query_flag, "Queries documentation")]

let () =
  Arg.parse speclist flags usage_msg;
  if (!Cmd.help_flag) == true then (Cmd.help () ) else ();
  if String.length !Cmd.query_flag > 0 then (Cmd.query () ) else ();
