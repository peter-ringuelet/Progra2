Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;
  
    // Estructuras nuevas
	listaCodigos = ^nodoCodigos;
	nodoCodigos = RECORD
		dato: integer;
		sig: listaCodigos;
	end;
	
	registroDatos = RECORD
		peso: integer;
		codigo: listaCodigos;
	end;
	
	arbolPesos = ^nodoPesos;
	nodoPesos = RECORD
		dato: registroDatos;
		HI: arbolPesos;
		HD: arbolPesos;
	end;
	

	
{-----------------------------------------------------------------------------
                        //NUEVO//                                           }	
	
procedure agregarOrdenado(var pri:listaCodigos; d: integer);
var
   nuevo, anterior, actual: listaCodigos;
begin
     new (nuevo);
     nuevo^.dato:= d;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato < nuevo^.dato) do begin
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



procedure insertar(var a:arbolPesos; d:encomienda);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.peso:=d.peso;
         a^.dato.codigo:= nil;
         agregarOrdenado(a^.dato.codigo, d.codigo);
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d.peso > a^.dato.peso)then
        insertar(a^.HD,d)
  else
    if(d.peso < a^.dato.peso)then
      insertar(a^.HI,d)
  else agregarOrdenado(a^.dato.codigo, d.codigo);
End;

procedure recorrerLista (l: lista; var a: arbolPesos);
var act: lista;
begin
    act:= l;
    while (act <> nil) do begin
        insertar(a,act^.dato);
        act:= act^.sig;
    end;
end;

procedure imprimirDato(r: registroDatos);
var act: listaCodigos;
begin
    act:= r.codigo;
    writeln('Peso: ', r.peso);
    while (act <> nil) do begin
        writeln('   Codigo: ', act^.dato);
        act:= act^.sig;
    end;
    writeln;
end;

Procedure enOrden( a: arbolPesos );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    imprimirDato(a^.dato);
    enOrden (a^.HD);
  end;
end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;


Var

 l: lista; a: arbolPesos;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 readln;
 recorrerLista(l,a);
 enOrden(a);
end.
