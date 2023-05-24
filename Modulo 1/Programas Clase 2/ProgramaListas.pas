Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;
Var
 L: Lista;
 n: integer;
 min: integer;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;


Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;


{-----------------------------------------------------------------------
*                      MINIMO RECURSIVO                                }
procedure Minimo(l: lista; var min: integer);
begin
	if(l <> nil) then
	begin
		if (l^.Datos < min) then min:= l^.Datos;
		Minimo(l^.sig,min);
	end;
end;


{-----------------------------------------------------------------------
*                      IMPRIMIR RECURSIVO                              }
procedure ImprimirRecursivo (l: lista);
begin
	if (l<>nil) then 
	begin
		write(l^.Datos, ' ');
		ImprimirRecursivo(l^.sig);
	end;
end;
		


begin
	min:= 999;
 L:=nil;
 randomize;
 n := random (100);
 While (n<>0) do Begin
   AgregarAdelante (L, n);
   n := random (100);
 End;
 writeln ('Lista generada: ');
 imprimir (L);
	Minimo(l,min);
	writeln;
	writeln('Numero minimo: ', min);
	writeln;
	ImprimirRecursivo(l);
 readln
end.
