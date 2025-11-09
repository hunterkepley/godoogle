(lang dune 3.20)

(name godoogle)

(generate_opam_files true)

(source
 (github hunterkepley/godoogle))

(authors "hunter kepley <kepley.l.hunter@gmail.com>")

(maintainers "hunter kepley <kepley.l.hunter@gmail.com>")

(license LICENSE)

(documentation https://github.com/hunterkepley/godoogle)

(package
 (name godoogle)
 (synopsis "Godot doc search")
 (description "Find info on Godot quickly with this CLI tool")
 (depends ocaml)
 (tags
  ("cli" "godot" "documentation")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
