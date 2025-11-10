open Godoogle

let usage_msg = "For help :: godoogle --help"

let args = ref []

let arg_func arg =
  args := arg :: !args

let speclist =
  [("--file", Arg.Set Cmd.file_flag, "Saves queried documentation to a local html file, './index.html' by default")]

let () =
  Arg.parse speclist arg_func usage_msg;
  (* Reverse the arg list before getting the command arg (arg list head); required to reverse *)
  let final_args = List.rev !args in
  let head_arg = Helpers.hd_safe final_args in
  (
    (* Handle empty args *)
    if List.is_empty !args then
      Helpers.print_err "No arguments provided, please run './godoogle info' or './godoogle --help' for more info on usage";
    (* Info command *)
    if head_arg = Consts.info_arg then 
      print_string Cmd_info.Runner.run
    else ();
    
    (* Query command *)
    let arg_value = Helpers.find_arg_value Consts.query_arg final_args in
    if head_arg = Consts.query_arg then
      Cmd_query.Runner.run arg_value !Cmd.file_flag ()
    else ();
    
  )
