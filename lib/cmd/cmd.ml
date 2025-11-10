(* Help command; No args *)
let info_flag = ref false
let info () =
  print_string (Cmd_info.Runner.run ())

(* Query command *)
let file_flag = ref false
let query query_url () =
  Cmd_query.Runner.run query_url !file_flag ()