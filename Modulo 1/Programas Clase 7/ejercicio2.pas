program ej;
Uses
     sysutils;
Type
    libro = RECORD
        titulo: integer;
        ISBN: integer;
        clasificador:string;
    end;
    
    listalibros = ^nodoLibros;
    nodoLibros = RECORD
        dato: libro;
        sig: listalibros;
    end;
    
    arbolLibro = ^nodoLibros1;
    nodoLibros1 = RECORD
        dato: libro;
        HI: arbolLibro;
        HD: arbolLibro;
    end;
{-------------------------------------------------------------------------------
                              Procesos                                         }
                              
{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listalibros; d: libro);
var
   aux: listalibros;
begin
     new(aux);
     aux^.dato := d;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listalibros);
var
   t: libro;
   texto: string;
   fin: integer;
begin
    fin:= 15;
     while ( fin <> 0) do Begin
          texto:= Concat( 'COD-', IntToStr(random (10)));
          t.titulo := random(100);
          t.clasificador := texto;
          t.ISBN := random(1000);
          agregarAdelante(l, t);
          fin:= fin -1;
     end;
end;

{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: libro);
begin
     with (t) do begin
          writeln('Titulo del libro: ', titulo, ', con ISBN:  ',ISBN, ', con clasificador bibliografico: ', clasificador);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listalibros);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure insertar(var a:arbolLibro; d: listalibros);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.titulo:= d^.dato.titulo;
         a^.dato.ISBN:= d^.dato.ISBN;
         a^.dato.clasificador:= d^.dato.clasificador;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d^.dato.ISBN > a^.dato.ISBN)then
        insertar(a^.HD,d)
  else
    if(d^.dato.ISBN < a^.dato.ISBN)then
      insertar(a^.HI,d);
End;

procedure cargarArbol(var a: arbolLibro; l: listalibros);
var act: listalibros; 
Begin
    act:= l;
    while (act <> nil) do Begin
        insertar(a,act);
        act:= act^.sig;
    end;
end;


{preOrden- imprime los datos del arbol empezando por la rama izquierda}
Procedure preOrden( a: arbolLibro; clasificador: string; var tot: integer);
begin
  if ( a <> nil ) then begin
    if (a^.dato.clasificador = clasificador) then tot:= tot +1;
    preOrden (a^.HI,clasificador,tot);
    preOrden (a^.HD,clasificador,tot);
  end;
end;

Procedure enOrden1( a: arbolLibro);
begin
  if ( a <> nil ) then begin
    enOrden1 (a^.HI);
    imprimir(a^.dato);
    enOrden1 (a^.HD);
  end;
end;

procedure buscar(a:arbolLibro; num:integer; var exito: boolean);
Begin
	if(a = nil)then
		exito:= exito
	else
		if(a^.dato.ISBN = num)then
                       exito:= true
        else
		if(a^.dato.ISBN > num)then buscar(a^.HI,num,exito)
	else
		buscar(a^.HD,num,exito);
End;


Procedure buscar1( a: arbolLibro; titulo: integer; var exito: boolean);
begin
  if ( a <> nil ) then begin
    if (a^.dato.titulo = titulo) then exito:= true;
    buscar1 (a^.HI,titulo,exito);
    buscar1 (a^.HD,titulo,exito);
  end;
end;




var l: listalibros; a: arbolLibro; exito: boolean;
    num: integer; clasificador: string; tot: integer;
    titulo: integer;

Begin
    l:= nil; 
    a:= nil;
    tot:= 0;
    crearLista(l);
    imprimirLista(l);
    cargarArbol(a,l);
    writeln;
    writeln('En orden: ');
    enOrden1(a);
    write('ISBN a buscar: '); readln(num);
    exito:= false;
    buscar(a,num,exito);
    if (exito) then writeln('Encontrado') 
    else writeln('El ISBN no se encuentra disponible en la base de datos');

    write('Clasificador a buscar: '); readln(clasificador);
    preOrden(a,clasificador,tot);
    if (tot = 0) then writeln('El codigo clasificador no se encuentra disponible en la base de datos.') 
    else writeln(tot);
    write('Titulo a buscar: '); readln(titulo);
    exito:= false;
    buscar1(a,titulo,exito);
    if (exito) then writeln('Encontrado') 
    else writeln('El titulo no se encuentra disponible en la base de datos');

End.




