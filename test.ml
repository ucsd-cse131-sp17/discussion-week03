open OUnit2
open Week03
open List

let id x = x

let t_string name value expected = name>::
  (fun ctxt -> assert_equal expected value ~printer:id)

let t_int name value expected = name>::
  (fun ctxt -> assert_equal expected value ~printer:string_of_int)

let string_of_a_list (printer: 'a -> string) (l: 'a list) : string = 
  let ss    = List.map printer l in
  let inner = String.concat ", " ss in
  "[" ^ inner ^ "]"

let t_int_list name value expected = name>::
  (fun ctxt -> assert_equal expected value ~printer:(string_of_a_list string_of_int))

let suite =
"suite">:::
 [
 ]
;;

run_test_tt_main suite
