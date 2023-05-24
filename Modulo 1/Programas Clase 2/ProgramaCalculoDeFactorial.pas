program CalculoDeFactorial;


{PROGRAMA PRINCIPAL}
function factorial(num: integer): integer;
begin
	if (num = 1) then factorial:= 1
	else factorial:=   num * factorial(num - 1);
end;
var 
  num: integer;

Begin

  write( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num));
  readln;
End.

