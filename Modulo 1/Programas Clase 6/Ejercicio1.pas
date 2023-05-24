Program ejercicio1; 
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;
     
{-------------------------------------------------------------------------------
                 Estructuras nuevas                                             }
    registroPuntaje = RECORD
        puntaje: integer;
        fecha: str10;
    end;
    
    listaPuntajes = ^nodoPuntajes;
    nodoPuntajes = RECORD
        dato: registroPuntaje;
        sig: listaPuntajes;
    end;
    
    registroJugador = RECORD
        dni: longint;
        nombreApellido: string;
        posicion: str10;
        punt: listaPuntajes;
    end;
        
    arbolJugadores = ^nodoJugadores;
    nodoJugadores = RECORD
        dato: registroJugador;
        HI: arbolJugadores;
        HD: arbolJugadores;
    end;
    
{-------------------------------------------------------------------------------
                    Procesos nuevos                                             }
procedure agregarAdelanteJugador(var l: listaPuntajes; d: jugador; f: str10);
var
  aux: listaPuntajes; r: registroPuntaje;
begin
  r.puntaje:= d.puntaje;
  r.fecha:= f;
  new(aux);
  aux^.dato := r;
  aux^.sig := l;
  l:= aux;
end;

procedure insertarJugador(var a:arbolJugadores; d: lista; f: str10);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.dni:= d^.dato.dni;
         a^.dato.nombreApellido:= d^.dato.nombreApellido;
         a^.dato.posicion:= d^.dato.posicion;
         a^.dato.punt:= nil;
         agregarAdelanteJugador(a^.dato.punt,d^.dato,f);
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d^.dato.dni> a^.dato.dni)then
        insertarJugador(a^.HD,d,f)
  else
    if(d^.dato.dni < a^.dato.dni)then
      insertarJugador(a^.HI,d,f)
  else agregarAdelanteJugador(a^.dato.punt,d^.dato,f);
End;

procedure cargarArbolJugadores(var a: arbolJugadores; l: listaPartidos);
var act: listaPartidos; f: str10;
Begin
    act:= l;
    while (act <> nil) do Begin
        f:= act^.dato.fecha;
        while (act^.dato.jugadores <> nil) do Begin
            insertarJugador(a,act^.dato.jugadores,f);
            act^.dato.jugadores:= act^.dato.jugadores^.sig;
        end;
        act:= act^.sig;
    end;
end;

procedure conteoLista(l: listaPuntajes; var punt: integer);
var act: listaPuntajes; 
begin
    act:= l;
    punt:= 0;
    while (act <> nil) do
    begin
        punt:= punt + act^.dato.puntaje;
        act:= act^.sig;
    end;
end;

procedure imprimirJugador2(j: registroJugador);
var punt: integer;
begin
    conteoLista(j.punt,punt);
    writeln('Jugador: ', j.nombreApellido, ' con dni ', j.dni, ' en posicion: ', j.posicion, ' y puntaje: ', punt);
end;



{enOrden- imprime los datos del arbol de forma ordenada}
Procedure enOrden( a: arbolJugadores );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HD);
    imprimirJugador2(a^.dato);
    enOrden (a^.HI);
  end;
end;

procedure busquedaAcotadaDNI(a: arbolJugadores; inf:longint; sup:longint; var cant: integer); 
begin
  if (a <> nil) then
    if (a^.dato.dni >= inf) then
      if (a^.dato.dni <= sup) then begin
        cant:= cant +1;
        busquedaAcotadaDNI(a^.HI, inf, sup, cant);
        busquedaAcotadaDNI (a^.HD, inf, sup, cant);
      end
      else
        busquedaAcotadaDNI(a^.HI, inf, sup, cant)
    else
      busquedaAcotadaDNI(a^.HD, inf, sup, cant);
end;

procedure cantPosicion(a: arbolJugadores; pos: str10; var cant: integer);
begin
  if ( a <> nil ) then begin
    if (a^.dato.posicion = pos) then cant:= cant +1;
    cantPosicion (a^.HI,pos,cant);
    cantPosicion (a^.HD,pos,cant);
  end;
end;
{-------------------------------------------------------------------------------
                        Procesos Ejercicio                                      }  
procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
          dni := random(36000000)+20000000; 
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;


procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


var
   l: listaPartidos; a: arbolJugadores; cant: integer; pos: str10;
begin
     Randomize;
     
     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}

     writeln('Fin del programa');
     readln;
     
    cargarArbolJugadores(a,l);
    writeln('cargado');
    readln;
    enOrden(a);
    cant:= 0;
    busquedaAcotadaDNI(a,30000000,40000000,cant);
    writeln(cant);
    cant:= 0;
    write('Posicion a buscar: '); readln(pos);
    cantPosicion(a,pos,cant);
    writeln(cant);
end.



