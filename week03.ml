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
  match opt with
  | None   -> true
  | Some _ -> false

let option_map (f: 'a -> 'b) (opt: 'a option) : 'b option =
  match opt with
  | None   -> None
  | Some a -> Some (f a)

let option_app (optf: ('a -> 'b) option) (opt: 'a option) : 'b option =
  match optf with
  | None   -> None
  | Some f -> option_map f opt
        
let option_default (def: 'a) (opt: 'a option) : 'a =
  match opt with
  | None   -> def
  | Some a -> a

let option_get (opt: 'a option) : 'a =
  match opt with
  | None   -> error "opt is None!"
  | Some a -> a

let rec find (ls: ('a * 'b) list) (key: 'a) : 'b option =
  match ls with
  | []       -> None
  | (a,b)::t -> if a = key then Some b else find t key

(* infix functions: 
   https://caml.inria.fr/pub/docs/manual-caml-light/node4.9.html
 *)

let res0 = 
  let helper (f: 'a -> 'b -> 'c) (x: 'a option) (y: 'b option) : 'c option = 
    match (x,y) with
    | (None,_) -> None
    | (_,None) -> None
    | (Some a, Some b) -> Some (f a b)
  in
  let ( =/ ) (x: int option) (y: int option) : int option = 
    match (x,y) with
    | (None,_) -> None
    | (_,None) -> None
    | (Some a, Some b) -> if b = 0 then None else Some (a / b)
  in
  let ( =* ) = helper ( * ) in
  let ( =+ ) = helper ( + ) in
  let ( =- ) = helper ( - ) in
  (Some 3 =/ Some 2) =* (None =- Some 3) =+ (Some 5)




(* Filter ******************************************)

let isEven x =
  x mod 2 = 0

let rec evens (l: int list) : int list =
  match l with
  | [] -> []
  | h::t -> if isEven h then h :: (evens t) else evens t

let rec fourLetters (l: string list) : string list =
  match l with
  | [] -> []
  | h::t -> if String.length h = 4 then h :: (fourLetters t) else fourLetters t











let rec filter (pred: 'a -> bool) (l: 'a list) : 'a list =
  match l with
  | [] -> []
  | h::t -> if pred h then h :: (filter pred t) else filter pred t

let evens'       = filter isEven

let fourLetters' = filter (fun x -> String.length x = 4)




(* Map ******************************************)


let rec listUpper (l: string list) : string list =
  match l with
  | []   -> []
  | h::t -> (String.uppercase h) :: (listUpper t)
  

let rec listSquare (l: int list) : int list =
  match l with
  | []   -> []
  | h::t -> (h * h) :: (listSquare t)
 









 
let rec map (f: 'a -> 'b) (l: 'a list) : 'b list =
  match l with
  | []   -> []
  | h::t -> f h :: map f t


let listUpper'  = map String.uppercase

let listSquare' = map (fun x -> x * x)




(* Fold ******************************************)

let rec sum (l: int list) : int = 
  match l with
  | []   -> 0
  | h::t -> h + sum t

let rec concat (l: string list) : string = 
  match l with
  | []   -> ""
  | h::t -> h ^ concat t











let rec fold_right (step: 'a -> 'acc -> 'acc) (l: 'a list) (acc: 'acc) : 'acc =
  match l with
  | []   -> acc
  | h::t -> step h (fold_right step t acc)


let sum' l  = fold_right (+) l 0

(*
sum' [1;2;3] = fold_right (+) [1;2;3] 0
             = (+) 1 (fold_right (+) [2;3] 0)
             = (+) 1 (2 (+) (fold_right (+) [3] 0))
             = (+) 1 (2 (+) (3 (+) (fold_right (+) [] 0)))
             = 1 (+) (2 (+) (3 (+) 0))
 *)

let concat' l = fold_right (^) l ""




(* Fold (Tail Recursive) ******************************************)

let rec sum_tr (l: int list) : int = 
  let rec helper l' acc = 
    match l' with
    | []   -> acc
    | h::t -> helper t (h + acc)
  in
  helper l 0

let rec concat_tr (l: string list) : string = 
  let rec helper l' acc = 
    match l' with
    | []   -> acc
    | h::t -> helper t (h ^ acc)
  in
  helper l ""











let rec fold_left (step: 'acc -> 'a -> 'acc) (acc: 'acc) (l: 'a list) : 'acc =
  let rec helper l' acc = 
    match l' with
    | []   -> acc
    | h::t -> helper t (step acc h)
  in
  helper l acc



(* Fold examples ******************************************)

let filter' (pred: 'a -> bool) (l: 'a list) : 'a list =
  let step acc a = if pred a then acc @ [a] else acc in
  let acc = [] in
  fold_left step acc l


let map' (f: 'a -> 'b) (l: 'a list) : 'b list =
  let step a acc = f a :: acc in
  let acc = [] in
  fold_right step l acc

let f1 = filter' isEven [1;2;3;4;5]

let f2 = map' String.uppercase ["foo"; "bar"]
