Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;
     
{-------------------------------------------------------------------------------
                            Estructuras Nuevas                                  }
    registroUsuarios = record
        codigoUsuario: integer;
        nombreUsuario: string;
        cantTweets: integer;
    end;
    
    arbolUsuarios = ^nodoUsuarios;
    nodoUsuarios = RECORD 
        dato: registroUsuarios;
        HI: arbolUsuarios;
        HD: arbolUsuarios;
    end;
    
{-------------------------------------------------------------------------------}

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
{-------------------------------------------------------------------------------
                            Procesos Nuevos                                     }
procedure insertar(var a:arbolUsuarios; d: listaTweets);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.codigoUsuario:= d^.dato.codigoUsuario;
         a^.dato.nombreUsuario:= d^.dato.nombreUsuario;
         a^.dato.cantTweets:= 1;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d^.dato.codigoUsuario> a^.dato.codigoUsuario)then
        insertar(a^.HD,d)
  else
    if(d^.dato.codigoUsuario < a^.dato.codigoUsuario)then
      insertar(a^.HI,d)
  else a^.dato.cantTweets:= a^.dato.cantTweets +1;
End;

procedure cargarArbol(var a: arbolUsuarios; l: listaTweets);
var act: listaTweets; 
Begin
    act:= l;
    while (act <> nil) do Begin
        insertar(a,act);
        act:= act^.sig;
    end;
end;

procedure busquedaAcotada(a: arbolUsuarios; inf:integer; sup:integer); 
begin
  if (a <> nil) then
    if (a^.dato.codigoUsuario >= inf) then
      if (a^.dato.codigoUsuario <= sup) then begin
        writeln(a^.dato.cantTweets);
        busquedaAcotada(a^.HI, inf, sup);
        busquedaAcotada(a^.HD, inf, sup);
      end
      else
        busquedaAcotada(a^.HI, inf, sup)
    else
      busquedaAcotada(a^.HD, inf, sup);
end;

{preOrden- imprime los datos del arbol empezando por la rama izquierda}
Procedure preOrden( a: arbolUsuarios; var max: integer; var nom: string);
begin
  if ( a <> nil ) then begin
    if (a^.dato.cantTweets > max) then begin
        max:= a^.dato.cantTweets;
        nom:= a^.dato.nombreUsuario;
    end;
    preOrden (a^.HI,max,nom);
    preOrden (a^.HD,max,nom);
  end;
end;

{-------------------------------------------------------------------------------}
var
   l: listaTweets; a: arbolUsuarios; max: integer; nom: string;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}
    cargarArbol(a,l);
    busquedaAcotada(a,100,700);
    writeln('Presionse una tecla para ver el nombre del maximo: ');
    readln;
    max:= -1;
    preOrden(a,max,nom);
    writeln(nom);
     writeln('Fin del programa');
     readln;
end.
        