(* Prime List *)
(* List all prime numbers up to the given number *)

fun filter(f,nil) = nil
|   filter(f,x::xs) = if f(x) then x::filter(f,xs)
                      else filter(f,xs);

fun naturalDiv(x,y) = 
    if x <= 1 then true
    else if y < x then (x mod y = 0) orelse naturalDiv(x,y+1)
    else false;

fun createList(x:int) = 
    if x < 1 then nil
    else createList(x-1) @ [x];

fun isPrime(nil) = nil
|   isPrime(x::xs) = filter(fn x => not(naturalDiv(x,2)),x::xs);

fun plist(x) = isPrime(createList(x));

plist(20);