(*
 * Copyright (c) 2011 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

type t =
  |MSS of int                      (* RFC793 *)
  |Window_size_shift of int        (* RFC1323 2.2 *)
  |SACK_ok                         (* RFC2018 *)
  |SACK of (int32 * int32) array   (* RFC2018 *)
  |Timestamp of (int32 * int32)    (* RFC1323 3.2 *)
  |Unknown of (int * string)       (* RFC793 *)

type ts = t list
val marshal: ts -> (OS.Istring.t -> unit)
val of_packet : Mpl.Tcp.o -> t list
val prettyprint : t list -> string
