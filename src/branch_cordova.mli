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

module InitSession : sig
  type t

  val init_session : unit -> t [@@js.global "Branch.initSession"]

  val then_ : t -> (data -> unit) -> unit [@@js.call]
end

val get_clicked_branch_link : data -> bool option
  [@@js.get "+clicked_branch_link"]

val get_canonical_url : data -> string option [@@js.get "$canonical_url"]

val get_non_branch_link : data -> string option [@@js.get "+non_branch_link"]

val get_match_guaranteed : data -> bool option [@@js.get "+match_guaranteed"]

val get_campaign : data -> string option [@@js.get "~campaign"]

val get_channel : data -> string option [@@js.get "~channel"]

val get_feature : data -> string option [@@js.get "~feature"]
