(* String Tokenizer *)
(* Breaks strings into tokens which are separated by delimiters. *)

fun revfilter(f,nil) = nil
|   revfilter(f,x::xs) = if f(x) then nil
                         else x::revfilter(f,xs);

fun next(f,nil) = nil
|   next(f,x::xs) = if f(x) then xs
                    else next(f,xs);

fun tokenhelper(x::xs) = implode (x::xs);

fun remover(nil,c: char) = nil
| remover(x::xs,c:char) = revfilter(fn x => x = c, x::xs) :: remover(next(fn x => x = c, x::xs),c);


fun mymap(f,nil) = nil
|   mymap(f,x::xs) = f(x) :: mymap(f,xs);

fun stringTokenizer(s:string,c:char) = mymap(fn(a)=>implode a, remover(explode s,c));

val myStr = "This is a string";
stringTokenizer(myStr,#" ");



