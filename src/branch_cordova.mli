[@@@js.stop]

val available : unit -> bool

val access_send_branch_event : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##._Branch]

[@@@js.implem
let access_send_branch_event () =
  Js_of_ocaml.Js.Optdef.test
    Js_of_ocaml.Js.Unsafe.global##._Branch##.sendBranchEvent]

val set_cookie_based_matching : str:string -> unit
  [@@js.global "Branch.setCookieBasedMatching"]

val set_request_metadata : key:string -> value:string -> unit
  [@@js.global "Branch.setRequestMetadata"]

(*TODO: I don't find any info about this function...*)
val send_branch_event : name:string -> Ojs.t -> unit
  [@@js.global "Branch.sendBranchEvent"]

type data

val init_session_then : (data -> unit) -> unit
  [@@js.global "Branch.initSession().then"]

val get_clicked_branch_link : data -> bool [@@js.get "clicked_branch_link"]

val get_canonical_url : data -> string [@@js.get "$canonical_url"]

val get_non_branch_link : data -> string [@@js.get "+non_branch_link"]

(*val get_form_data : data -> x:string -> string [@@js.get x]*)
