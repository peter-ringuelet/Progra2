Program arboles;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;

{crearlistaordenada - Resuelve la inserción de la estructura ordenada}
procedure crearlistaordenada (var pri:lista; num:integer);
var
   nuevo, anterior, actual: lista;
begin
     new (nuevo);
     nuevo^.dato:= num;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato < nuevo^.dato ) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
{----------------NUEVO---------------}
procedure insertar(var a:arbol; n:integer);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato:=n;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(n > a^.dato)then
        insertar(a^.HD,n)
  else
    if(n < a^.dato)then
      insertar(a^.HI,n);
End;
{preOrden- imprime los datos del arbol empezando por la rama izquierda}
Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    write (a^.dato, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;
{enOrden- imprime los datos del arbol de forma ordenada}
Procedure enOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato, '   ');
    enOrden (a^.HD)
  end;
end;
{postOrden- imprime los datos del arbol empezando por la derecha}
Procedure postOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    postOrden (a^.HD);
	write (a^.dato, '   ');
    postOrden(a^.HI)
  end;
end;
{BUSCAR}
procedure buscar(a:arbol; num:integer; var pos:arbol);
Begin
	if(a = nil)then
		pos:=pos
	else
		if(a^.dato = num)then
                       pos:=a
        else
		if(a^.dato > num)then buscar(a^.HI,num,pos)
	else
		buscar(a^.HD,num,pos);
End;

{Buscar minimo}
procedure verMin(a:arbol; var min:integer);
begin
	if(a<>nil)then begin
		min:=a^.dato;
		verMin(a^.HI,min);
	end;
end;

{Buscar maximo}
procedure verMax(a:arbol;var max:integer);
begin
	if(a<>nil)then begin
		max:=a^.dato;
		verMax(a^.HD,max);
	end;
end;

procedure busquedaAcotada(a: arbol; inf:integer; sup:integer); 
begin
  if (a <> nil) then
    if (a^.dato >= inf) then
      if (a^.dato<= sup) then begin
        write(a^.dato, ' ');
        busquedaAcotada(a^.HI, inf, sup);
        busquedaAcotada (a^.HD, inf, sup);
      end
      else
        busquedaAcotada(a^.HI, inf, sup)
    else
      busquedaAcotada(a^.HD, inf, sup);
end;

Var

	l: lista;
	a:arbol;
	num:integer;
    pos:arbol;
	min,max:integer;
	inf, sup: integer;
begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 writeln(' ');
 {Recorrer la lista e insertar datos en arbol }
 a:=nil;
 while(l<>nil) do begin
   insertar(a,l^.dato);
   l:=l^.sig;
 end;
 imprimirpornivel(a);

 {pre,post y enOrden}
 writeln('Pre Orden');
 preOrden(a);writeln('');
  writeln('Post Orden');
 postOrden(a);writeln('');
  writeln('En Orden');
 enOrden(a);writeln('');
 writeln(' ');

 {Buscar número dentro del arbol}
 pos:=nil;
 write('Ingrese el numero a buscar: ');readln(num);
 buscar(a,num,pos);
 if(pos <>nil)then writeln('se encontro')
 else writeln('no se encontro');

 {Buscar minimo en arbol}
 min:=-1;
 verMin(a,min);
 writeln('Minimo: ',min);
 {Buscar minimo en arbol}
 max:=-1;
 verMax(a,max);
 writeln('Maximo: ',max);
 
 write('Numero minimo: ');
 readln(inf);
 write('Numero maximo: ');
 readln(sup);
 busquedaAcotada(a,inf,sup);
 

 readln;
end.
