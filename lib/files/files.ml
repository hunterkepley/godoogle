let write_to_file file message () =
  let oc = open_out file in
  (* create or truncate file, return channel *)
  Printf.fprintf oc "%s\n" message;
  (* write something *)
  close_out oc