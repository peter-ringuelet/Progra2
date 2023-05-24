Program TPGrupoX; 
Uses
     sysutils;
Type
     str70= string[70];
     
	 jugador = record
        DNI: longint;
	    nombre_apellido: str70;
        equipo: str70;
	    goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;
	
    partido= record
		identificador: longint;
		local: str70;
		visitante: str70;
		fecha_partido: fecha;
        estadio: str70;
		goleadores: lista;
     end;

     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;

     nombres= array [1..20] of str70;

{------------------------------------------------------------------------------
                    DATOS NUEVOS                                                }
                    
    registroGoles = RECORD
        fecha_partido: fecha;
        goles: integer;
    end;
    
    listaGoles = ^ nodoGoles;
    nodoGoles = RECORD
        dato: registroGoles;
        sig: listaGoles;
    end;
    
    registroJugador = RECORD 
        dni: longint;
        nombre_apellido: str70;
        equipo: str70;
        goles: listaGoles;
    end;
    
    arbolJugadores = ^nodoJugadores;
    nodoJugadores = RECORD
        dato: registroJugador;
        HI: arbolJugadores;
        HD: arbolJugadores;
    end;
    
{------------------------------------------------------------------------------}
procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(12)+1;
  if(f.mes = 2) and (f.dia > 28)then
	f.dia := 28
  else
	if((f.mes = 4) or (f.mes = 6) or (f.mes =9) or (f.mes = 11)) and (f.dia = 31)then
		f.dia := 30;
  f.anio:=2022;
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

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Atletico Tucuman';
     v[2]:='Huracan';
     v[3]:='Gimnasia LP';
     v[4]:='Godoy Cruz';
     v[5]:='Argentino Juniors';
     v[6]:='River';
     v[7]:='Boca';
     v[8]:='Racing';
     v[9]:='Platense';
     v[10]:='San Lorenzo';
     v[11]:='Patronato';
     v[12]:='Estudiantes';
     v[13]:='Union';
     v[14]:='Newells';
     v[15]:='Barracas';
     v[16]:='Tigre';
     v[17]:='Arsenal';
     v[18]:='Sarmiento';
     v[19]:='Central';
     v[20]:='Colon';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(2);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Colon')or(visitante='Colon'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   equipo:='Colon';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            equipo:=local
          else
            equipo:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(20)+1;
     v[1]:= 'Antonio Vespucio Liberti';
     v[2]:= 'Mario Alberto Kempes';
     v[3]:= 'Alberto Armando';
     v[4]:= 'Ciudad de La Plata';
     v[5]:= 'Presidente Peron';
     v[6]:= 'Jose Amalfitani';
     v[7]:= 'Tomas Adolfo Duco';
     v[8]:= 'Libertadores de America';
     v[9]:= 'Pedro Bidegain';
     v[10]:= 'Nestor Diaz Perez';
     v[11]:= 'Marcelo Bielsa';
     v[12]:= 'Gigante de Arroyito';
     v[13]:= 'Malvinas Argentinas';
     v[14]:= 'Brigadier General Estanislao Lopez';
     v[15]:= 'Eduardo Gallardon';
     v[16]:= 'Jose Maria Minella';
     v[17]:= 'Florencio Sola';
     v[18]:= 'Monumental Jose Fierro';
     v[19]:= 'Nueva Espa�a';
     v[20]:= 'Nuevo Francisco Urbano';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               identificador:= random (100000)+1;
               pos:= random(20)+1;
               estadio:= v[pos];
               loc:= random(20)+1;
               local:=v2[loc];
               vis:= random(20)+1;
               visitante:=v2[vis];
               while(local=visitante)do
               begin
                   vis:= random(20)+1;
                   visitante:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, local, visitante);
          end;
          agregar(l, p);
       end;
end;


procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ', goles);
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
          writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

{------------------------------------------------------------------------------
                Procesos Nuevos                                                 }

{Agrega la cantidad de goles y la fecha del partido en que se hicieron a la lista de goles}
procedure agregarAdelanteGol(var l: listaGoles; j: jugador; f: fecha);
var
  aux: listaGoles; r: registroGoles;
begin
  r.fecha_partido:= f;
  r.goles:= j.goles;
  new(aux);
  aux^.dato := r;
  aux^.sig := l;
  l:= aux;
end;

{Inserta un jugador al arbol de jugadores y en caso de ya estar, agrega la cantidad de goles y su fecha a la lista del jugador}
procedure insertarJugador(var a:arbolJugadores; j: lista; f: fecha);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.dni:= j^.dato.dni;
         a^.dato.nombre_apellido:= j^.dato.nombre_apellido;
         a^.dato.equipo:= j^.dato.equipo;
         a^.dato.goles:= nil;
         agregarAdelanteGol(a^.dato.goles,j^.dato,f);
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(j^.dato.dni> a^.dato.dni)then
        insertarJugador(a^.HD,j,f)
  else
    if(j^.dato.dni < a^.dato.dni)then
      insertarJugador(a^.HI,j,f)
  else agregarAdelanteGol(a^.dato.goles,j^.dato,f);
End;

{Carga todos los jugadores al arbol}
procedure cargarArbolJugadores(var a: arbolJugadores; l: listaPartidos);
var act: listaPartidos; f: fecha;
Begin
    act:= l;
    while (act <> nil) do Begin
        f:= act^.dato.fecha_partido;
        while (act^.dato.goleadores <> nil) do Begin
            insertarJugador(a,act^.dato.goleadores,f);
            act^.dato.goleadores:= act^.dato.goleadores^.sig;
        end;
        act:= act^.sig;
    end;
end;

{Cuenta la cantidad de goles que hizo cada jugador}
procedure conteoGoles(l: listaGoles; var totGoles: integer);
var act: listaGoles; 
begin
    act:= l;
    totGoles:= 0;
    while (act <> nil) do
    begin
        totGoles:= totGoles + act^.dato.goles;
        act:= act^.sig;
    end;
end;


{Busca el equipo en el cual se encuentra el goleador}
Procedure buscarMax( a: arbolJugadores; var maxGoles: integer; var equipoMax: str70; totGoles: integer);
begin
  if ( a <> nil ) then begin
    conteoGoles(a^.dato.goles,totGoles);
    if (totGoles > maxGoles) then begin
        maxGoles:= totGoles;
        equipoMax:= a^.dato.equipo;
    end;
    buscarMax (a^.HI, maxGoles, equipoMax, totGoles);
    buscarMax (a^.HD, maxGoles, equipoMax, totGoles)
  end;
end;


{Imprime DNI, Nombre y Apellido de un jugador}
procedure imprimirDatosJugador (j: registroJugador);
begin
    writeln('DNI: ', j.dni);
    writeln('Nombre y Apellido: ', j.nombre_apellido);
end;


{Imprime DNI, Nombre y Apellido de todos los jugadores cuyo DNI este entre cierto rango}
procedure busquedaAcotadaDNI(a: arbolJugadores; inf:longint; sup:longint); 
begin
  if (a <> nil) then
    if (a^.dato.dni >= inf) then
      if (a^.dato.dni <= sup) then begin
        imprimirDatosJugador(a^.dato);
        busquedaAcotadaDNI(a^.HI, inf, sup);
        busquedaAcotadaDNI (a^.HD, inf, sup);
      end
      else
        busquedaAcotadaDNI(a^.HI, inf, sup)
    else
      busquedaAcotadaDNI(a^.HD, inf, sup);
end;


{Buscar el jugador cuyo DNI sea el minimo}
procedure verMin(a:arbolJugadores; var min:registroJugador);
begin
	if(a<>nil)then begin
		min:=a^.dato;
		verMin(a^.HI,min);
	end;
end;


{Elimina al jugador cuyo DNI coincida con el ingresado}
procedure borrarJugador (var a: arbolJugadores; dni: longint);
var aux: arbolJugadores; min: registroJugador;
begin
    if(a = nil) then begin	
		writeln('El dni no se encontro');
		writeln;
		end
    else
    begin
        if (a^.dato.dni > dni) then borrarJugador(a^.HI,dni)
            else if (a^.dato.dni < dni) then borrarJugador(a^.HD,dni)
                else if (a^.HI = nil) and (a^.HD <> nil) then 
                begin
                    aux:= a;
                    a:= a^.HD;
                    dispose(aux);
                end
                else if (a^.HI <> nil) and (a^.HD = nil) then 
                begin 
                    aux:= a;
                    a:= a^.HI;
                    dispose(aux);
                end
                else if (a^.HI = nil) and (a^.HD = nil) then a:= nil
                else 
                    begin
                        verMin(a^.HD,min);
                        a^.dato:=min;
                        borrarJugador(a^.HD,min.dni);
                    end;
    end;
end;

{Imprime los datos del arbol de forma ordenada}
Procedure enOrden( a: arbolJugadores );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    imprimirDatosJugador(a^.dato);
    enOrden (a^.HD)
  end;
end;

var
   l: listaPartidos; a: arbolJugadores; maxGoles, totGoles: integer; equipoMax:str70;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);
	 writeln;
	 writeln;
     {Carga la nueva estructura}
     cargarArbolJugadores(a,l);
     
     {Busca el equipo del jugador que mas goles hizo y lo imprime}
     maxGoles:= -1;
     buscarMax(a, maxGoles, equipoMax, totGoles);
     writeln('El equipo del jugador que mas goles hizo es: ', equipoMax);
     writeln;
     writeln;
     
     {Imprime el dni, nombre y apellido de los jugadores cuyo dni este entre 28000000 y 32000000}
     writeln('Datos de los jugadores cuyo DNI se encuentra entre 28000000 y 32000000: ');
     busquedaAcotadaDNI(a, 28000000, 32000000);
     writeln;
     writeln;
     
     {Imprime en Orden los DNI, Nombre y Apellido de los jugadores cargados en el arbol}
	 writeln('DNI, Nombre y Apellido de los jugadores del arbol en orden: ');
     enOrden(a);
     writeln;
     writeln;
     
     {Borra al jugador con DNI: 34807474}
     borrarJugador(a,34807474);
     
     {Imprime en Orden los DNI, Nombre y Apellido de los jugadores cargados en el arbol}
	 writeln('DNI, Nombre y Apellido de los jugadores del arbol en orden despues de haber llamado al proceso "borrarJugador": ');
     enOrden(a);
     writeln;
     writeln;
     
     writeln('Fin del programa');
     readln;
end.
