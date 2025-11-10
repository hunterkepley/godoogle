open Godoogle

let usage_msg = "For help :: godoogle --help"

let args = ref []

let arg_func arg =
  args := arg :: !args

let speclist =
  [("--file", Arg.Set Cmd.file_flag, "Saves queried documentation to a local html file")]

let () =
  Arg.parse speclist arg_func usage_msg;
  (* Reverse the arg list before getting the command arg (arg list head); required to reverse *)
  let head_arg = Helpers.hd_safe (List.rev !args) in
  (
    (* Info command *)
    if head_arg = Consts.info_arg then 
      Cmd.info ()
    else ();
    
    (* Query command *)
    let arg_value = Helpers.find_arg_value Consts.query_arg (List.rev !args) in
    if head_arg = Consts.query_arg then
      Cmd.query arg_value ()
    else ();
    
  )
