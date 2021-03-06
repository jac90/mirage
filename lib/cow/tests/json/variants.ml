open Cow

type t = [ `foo | `bar of int * string ] with json

let run () =
	let t1 = `foo in
	let t2 = `bar (3, "bar") in

  Printf.printf "\n==Testing variant encoding==\n";

	let j1 = json_of_t t1 in
	let j2 = json_of_t t2 in

	Printf.printf "\n * json:\n";
  Printf.printf "    - j1 = %s\n    - j2 = %s\n%!" (Json.to_string j1) (Json.to_string j2);

	let t1' = t_of_json j1 in
	let t2' = t_of_json j2 in

	Printf.printf "\n * sanity check:\n";

	Printf.printf "    - t1 = t1' :%b\n%!" (t1 = t1');
	assert (t1 = t1');

  Printf.printf "    - t2 = t2' :%b\n%!" (t2 = t2');
	assert (t2 = t2')
