program Recursion;

var 
  num, maximo: integer;
  
  
//----------- PROCESO Digito Maximo --------------//
procedure digitoMaximo(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then									// 	SI FUNCIONA 
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
    writeln('max: ', max);
end;


//---------- FUNCION Digito Maximo ------------//
function DigitoMaximo (n: integer): integer;
var 
	dig: integer;
begin
	dig:= n mod 10;
	if (dig > DigitoMaximo) then DigitoMaximo:= dig;		// ESTA MAL, NO FUNCIONA 
	n:= n div 10;
	if(n <> 0) then DigitoMaximo(n);
end;


Begin
  maximo:=-1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  readln;
End.

