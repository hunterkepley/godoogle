(* Help command; No args *)
let help_flag = ref false
let help () =
  print_string (Cmd_help.Runner.run ())

(* Query command *)
let query_flag = ref ""
let query () =
  print_string (Cmd_query.Runner.run !query_flag () )