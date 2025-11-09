open Godoogle

let usage_msg = "For help :: godoogle --help"

let help = ref false

let user_flags = ref []

let flags flag =
  user_flags := flag :: !user_flags

let speclist =
  [("--help", Arg.Set help, "Prints help message")]

let () =
  Arg.parse speclist flags usage_msg;
  if !help then Cmd.help else ()
