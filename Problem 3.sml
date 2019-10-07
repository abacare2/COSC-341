(*Problem 3

fun multinHelp(a,b,c)=
  if c=(~1) then nil
  else a :: multinHelp(a*b,b,c-1);

fun multin(l)=
    multinHelp(hd l, hd(tl l), hd(tl (tl l)));

multin([2,3,5]);
*)
fun multinHelp(0,0,0)=nil
|   multinHelp(a,b,c) = if c=(~1) then nil 
                        else a :: multinHelp(a*b,b,c-1);

fun multin(nil) = nil
|   multin(x::xs) = multinHelp(x,hd xs,hd(tl(xs)));

multin([2,3,5]);