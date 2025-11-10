(* open Soup *)
open Curl

module Runner = struct
  let string_of_uri uri =
    try
      let connection = init () in
      let write_buff = Buffer.create 0 in
      set_writefunction connection (fun x -> Buffer.add_string write_buff x; String.length x);
      set_url connection uri;
      perform connection;
      global_cleanup ();
      Buffer.contents write_buff
    with _ ->
      raise (Failure ("Failed to download from " ^ uri))
  let run url to_file () =
    let html = string_of_uri url in
    if to_file then Files.write_to_file "index.html" html () else print_string html
  end