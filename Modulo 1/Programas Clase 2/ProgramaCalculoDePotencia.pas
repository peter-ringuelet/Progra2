program CalculoDePotencia;


Function potencia (x,n: integer): real;
begin
	if (n = 0) then potencia:= 1
	else potencia:= x * potencia(x,n-1);
end;


{PROGRAMA PRINCIPAL}
var
   n, x: integer;


begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln( potencia(x,n):10:0);

     readln;
end.
