(* Substring *)
(* Check whether the first string is a substring of the second string. Returns the index position if the first string is a substring or -1 if not *)

fun ispre(nil,nil) = true
|   ispre(_,nil) = false
|   ispre(nil,_) = true
|   ispre(x::xs,y::ys) = if x=y then ispre(xs,ys)
                         else false;

fun subHelp(nil,nil)= 0
|   subHelp(_,nil) = ~1
|   subHelp(l,x::xs) = if ispre(l,x::xs) then 0
                         else 1+subHelp(l,xs);

fun subString(s:string,x:string) = 
subHelp(explode s,explode x);

subString("bc","abcabc");
subString("aaa","aaaa");