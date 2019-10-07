fun str2intHelp(a)=
  if null (tl(a)) then (ord(hd a)-48)*10
  else str2intHelp(tl a)+((ord(hd a)-48)*10);

fun helpHelp(l)=
  if null (tl l) then (ord(hd l)-48)*10
  else (ord(hd l)-48)*10 + helpHelp(tl l);


fun str2int (a)=
helpHelp(explode a);

str2int("1234");