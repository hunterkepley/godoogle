# GODOOGLE (Godot Google)

#### This project uses NO generative AI whatsoever. It is a project intended to teach myself OCaml by creating something useful

## What is GODOOGLE?

> Godoogle is an easy to use CLI search tool for Godot documentation which removes the toil of dealing with polymorphic object documentation nesting

Have you ever tried to look for a function in the Godot docs for 10 minutes until you realize it's in a parent node's documentation? This documentation search tool includes an array of solutions to problems such as these. For example, combining polymorphic parent's documentation recursively in the child's documentation, providing a series of links, etc

---

## Building

You need [dune](https://dune.build) and the [OCaml compiler](https://ocaml.org)

Then just run `make build`

## Running

`./godoogle.sh` will run Godoogle; future plans to have a script to add this to your path via appending/prepending to your zshrc/bashrc

## Usage

`./godoogle.sh info` - Help command (`help` is an alias. This CLI does not have a `--help`)

`./godoogle.sh query <URL>` - Queries `<URL>`, useful for downloading HTML files locally. Not specifically for Godot.
 Eventually may improve this command by adding searching+parsing+combining of documents, and containing it's domain to Godot.
 For now it works for what it does

`./godoogle.sh search <TERM>` - Smartly searches godot docs using specific parameters/filters. Flags such as `--base-node`
 will influence the search to traverse up and down document trees where a child has multiple parents that may contain the
 information desired

---

### Other notes

May end up making a static webpage generator for this tool to read the docs outside of the terminal, but that will be after the CLI functionality is complete

