(* Permutation *)
(* Generate the permutation of  the identity list from 1 to n[1,2,...,n] *)


fun simpleMap(f,nil) = nil
|   simpleMap(f,x::xs) = f(x) :: simpleMap(f,xs);

fun interleave(i,nil) = [[i]]
|   interleave(i,x::xs) = (i::x::xs) :: simpleMap(fn xs => x::xs, interleave(i,xs));

fun createList(x:int) = 
     if x < 1 then nil
     else createList(x-1)@[x];

interleave(4,[1,2,3]);

fun permu(x) = interleave(x,createList(x-1));

permu(3);
