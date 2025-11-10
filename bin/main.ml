open Godoogle

let usage_msg = "For help :: godoogle --help"

let args = ref []

let arg_func arg =
  args := arg :: !args

(* Basically unbinds the actual help flag. Makes the CLI totally custom, this message never shows *)
let disable_help_flags = [("--help", Arg.Set Cmd.help_flag, "");
  ("-help", Arg.Set Cmd.help_flag, "");
  ("-h", Arg.Set Cmd.help_flag, "")]
let speclist =
  disable_help_flags @ [("--file", Arg.Set Cmd.query_file_flag, "Saves queried documentation to a local html file, './index.html' by default");
  ("--base-node", Arg.Set_string Cmd.search_base_node_flag, "Base node to search for docs from. Example: if you want "^
    "'global_position' from a Node2D, not a Node3D")]

let possible_arg_list = [Consts.info_arg; Consts.help_arg; Consts.query_arg; Consts.search_arg]

let () =
  Arg.parse speclist arg_func usage_msg;
  (* Reverse the arg list before getting the command arg (arg list head); required to reverse *)
  let final_args = List.rev !args in
  let head_arg = Helpers.hd_safe final_args in
  (
    (* Handle empty args *)
    if List.is_empty !args then
      Helpers.print_err Consts.no_args_err;
    (* Handle incorrect arg *)
    if not (List.exists (fun x -> x = head_arg) possible_arg_list) then Helpers.print_err (Consts.incorrect_arg_err head_arg);

    (* Info command *)
    if head_arg = Consts.info_arg || head_arg = Consts.help_arg then 
      print_string Cmd_info.Runner.run
    else ();
    
    (* Query command *)
    let arg_value = Helpers.find_arg_value Consts.query_arg final_args in
    if head_arg = Consts.query_arg then
      Cmd_query.Runner.run arg_value !Cmd.query_file_flag
    else ();

    (* Search command *)
    let arg_value = Helpers.find_arg_value Consts.search_arg final_args in
    if head_arg = Consts.search_arg then
      Cmd_search.Runner.run arg_value !Cmd.search_base_node_flag
    else ();
  )
