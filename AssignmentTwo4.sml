(* Mode *)
(* Returns the mode and its occurrence. If there is a tie, return all of them. *)

fun remv(_,nil) = nil
|   remv(n,x::xs) = if (x=n) then remv(n,xs)
                    else x::remv(n,xs);
fun remvdub(nil)=nil
|   remvdub(x::xs) = x::remvdub(remv(x,x::xs));

fun count (_, nil) = 0
|   count (a,x::xs) = if x = a then 1+ count(a, xs) else 0 + count(a, xs);

fun occrHelp(nil,_) = nil
|   occrHelp(x::xs,L)= (x, count(x, L)) :: occrHelp(xs, L);

fun occr (L) = 
occrHelp(remvdub(L),L);

fun find2(x:(''a*int)) = #2(x);
 
fun modeHelp(L) = 
   if null L then nil
   else if null (tl L) then [hd L]
   else if find2(hd L) = find2(hd(tl L)) then hd L :: modeHelp(tl L)
   else if find2(hd L) < find2(hd(tl L)) then modeHelp(tl L)
   else modeHelp((hd L) :: (tl (tl L)));

fun modeL(L) =
modeHelp(occr(L));

val z = [1,1,2,1,3,3,3,5,8];
val answerZ = modeL(z);

val x = [true,true,false,true];
val answerX = modeL(x);








(* attempt at pattern style
fun isgreater((x,a)) =  a;

fun modeL(nil) = nil
|   modeL((_,nil)::(y,b)::xs) = modeL((y,b)::xs)
|   modeL((x,a)::(_,nil)::xs) = modeL((x,a)::xs)
|   modeL(x::y::xs) = if (isgreater(x) < isgreater(y)) then modeL(y::xs)
                      else modeL(x::xs);
*)

(* higher order style?
fun filter(f,nil) = nil
|   filter(f, x::xs) = if f(x) then x::filter(f,xs)
                       else nil;
fun myL(nil) = nil
|   myL((x,a)::(y,b)::xs) = filter(fn x => a > b, (x,a)::(y,b)::xs)::myL((x,a)::(y,b)::xs);


fun test((x,a)::(y,b)::xs) = filter(fn x => a > b, (x,a)::(y,b)::xs)::test((x,a)::xs);

fun modeHelp2(L) = 
   if null L then nil
   else if null (tl L) then [hd L]
   else if filter(fn x => find2(hd L) < find2(hd(tl L))) then modeHelp2(tl L)
   else modeHelp2((hd L) :: (tl (tl L)));

*)





