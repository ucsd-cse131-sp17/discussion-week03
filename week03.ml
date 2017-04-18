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

let option_map (f: 'a -> 'b) (opt: 'a option) : 'b option =
  error "undefined"

let option_app (optf: ('a -> 'b) option) (opt: 'a option) : 'b option =
  error "undefined"
        
let option_default (def: 'a) (opt: 'a option) : 'a =
  error "undefined"

let option_get (opt: 'a option) : 'a =
  error "undefined"

let rec find (ls: ('a * 'b) list) (x: 'a) : 'b option =
  error "undefined"

(* infix functions: 
   https://caml.inria.fr/pub/docs/manual-caml-light/node4.9.html
 *)

let res0 = 
  let ( =/ ) (x: int option) (y: int option) : int option = 
    error "undefined" 
  in
  let helper (op: 'a -> 'b -> 'c) (x: 'a option) (y: 'b option) : 'c option = 
    error "undefined" 
  in
  let ( =* ) = helper ( * ) in
  let ( =+ ) = helper ( + ) in
  let ( =- ) = helper ( - ) in
  (Some 3 =/ Some 2) =* (Some 1 =- Some 3) =+ (Some 5)




(* Filter ******************************************)

let isEven x =
  x mod 2 = 0

let rec evens (l: int list) : int list =
  error "undefined"

let rec fourLetters (l: string list) : string list =
  error "undefined"











let rec filter (pred: 'a -> bool) (l: 'a list) : 'a list =
  error "undefined"

let evens'       = error "undefined"

let fourLetters' = error "undefined"




(* Map ******************************************)


let rec listUpper (l: string list) : string list =
  error "undefined"

let rec listSquare (l: int list) : int list =
  error "undefined"
 









 
let rec map (f: 'a -> 'b) (l: 'a list) : 'b list =
  error "undefined"


let listUpper'  = error "undefined" 

let listSquare' = error "undefined"




(* Fold ******************************************)

let rec sum (l: int list) : int = 
  error "undefined"

let rec concat (l: string list) : string = 
  error "undefined"











let rec fold_right (step: 'a -> 'acc -> 'acc) (l: 'a list) (acc: 'acc) : 'acc =
  error "undefined"




(* Fold (Tail Recursive) ******************************************)

let rec sum_tr (l: int list) : int = 
  error "undefined"

let rec concat_tr (l: string list) : string = 
  error "undefined"











let rec fold_left (step: 'acc -> 'a -> 'acc) (acc: 'acc) (l: 'a list) : 'acc =
  error "undefined"




(* Fold examples ******************************************)

let filter' (pred: 'a -> bool) (l: 'a list) : 'a list =
  error "undefined"

let map' (f: 'a -> 'b) (l: 'a list) : 'b list =
  error "undefined"
