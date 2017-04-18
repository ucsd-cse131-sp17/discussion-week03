open List;;
open Helper;;
open OUnit2;;

(* git page:
   https://github.com/ucsd-cse131-sp17/discussion-week03
 *)

(* Option data type ******************************************)

(*
type 'a option = None
               | Some of 'a
*)

let is_none (opt: 'a option) : bool =
  error "undefined"

let option_get (opt: 'a option) : 'a =
  error "undefined"

let option_map (f: 'a -> 'b) (def: 'a) (opt: 'a option) : 'b option =
  error "undefined"
        
let option_default (def: 'a) (opt: 'a option) : 'a =
  error "undefined"

