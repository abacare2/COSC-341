(* Assignment Two *)
(* Mode *)

fun count (_, nil) = 0
|   count (a,x::xs) = if x = a then 1+ count(a, xs) else 0 + count(a, xs);


fun occrHelp(nil,_) = nil
|   occrHelp(x::xs,L)= (x, count(x, L)) :: occrHelp(xs, L);

fun occr (L) = 
occrHelp(remvdub(L),L);

occr([1,2,1,2,3,2])