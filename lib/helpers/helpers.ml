let hd_safe l = match l with
  | [] -> ""
  | h :: _ -> h

let rec find_arg_value v l = match l with
  | [] -> ""
  | h :: t -> if h = v then hd_safe t else find_arg_value v t

let print_err s =
  raise (Failure("ERROR >> " ^ s))
