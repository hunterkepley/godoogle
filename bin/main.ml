let usage_msg = "For help :: godoogle --help"

let user_flags = ref []

let flags flag =
  user_flags := flag :: !user_flags

let () =
  Arg.parse speclist flags usage_msg
