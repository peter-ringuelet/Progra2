program ActividadColaborativaGeany.pas;
type
    destino = RECORD
        nombre: string;
        distancia: real;
        cantPasajes: integer;
    end;
    
    arbolDestinos = ^nodoDestinos;
    nodoDestinos = RECORD
        dato: destino;
        HI: arbolDestinos;
        HD: arbolDestinos;
    end;
    
{---------------------------------------------------}
procedure InicializarEstructuras(var aNombres, aDistancia: arbolDestinos);
begin
    aNombres:= nil;
    aDistancia:= nil;
end;

{---------------------------------------------------}
procedure LeerDestino (var d: destino);
begin
    write('Nombre del destino: ');
    readln(d.nombre);
    write('Distancia(Km): ');
    readln(d.distancia);
    write('Cantidad de pasajes vendidos: ');
    readln(d.cantPasajes);
end;

{---------------------------------------------------}
{INSERTAR}
procedure insertarNombres(var a:arbolDestinos; d:destino);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato:=d;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d.nombre > a^.dato.nombre)then
        insertarNombres(a^.HD,d)
  else
    if(d.nombre < a^.dato.nombre)then
      insertarNombres(a^.HI,d);
End;

procedure insertarDistancia(var a:arbolDestinos; d:destino);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato:=d;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d.distancia > a^.dato.distancia)then
        insertarNombres(a^.HD,d)
  else
    if(d.distancia < a^.dato.distancia)then
      insertarNombres(a^.HI,d);
End;



{---------------------------------------------------}
{ImprimirDestino - Imprime un Destino en especifico}
procedure ImprimirDestino (d: destino);
begin
    writeln('Nombre del destino: ', d.nombre);
    writeln('Distancia del destino: ', d.distancia:2:2);
    writeln('Cantidad de pasajes vendidos: ', d.cantPasajes);
end;

{enOrden- imprime los datos del arbol de forma ordenada}
Procedure enOrden( a: arbolDestinos );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    ImprimirDestino(a^.dato);
    enOrden (a^.HD)
  end;
end;

procedure buscarPos(a:arbolDestinos; destino:string; var pos:arbolDestinos);
Begin
	if(a = nil)then
		pos:=pos
	else
		if(a^.dato.nombre = destino)then
                       pos:=a
        else
		if(a^.dato.nombre > destino)then buscarPos(a^.HI,destino,pos)
	else
		buscarPos(a^.HD,destino,pos);
End;

procedure Buscar (a:arbolDestinos);
var d: string; pos: arbolDestinos;
Begin
    write('Nombre del destino a buscar: ');
    readln(d);
    buscarPos(a,d,pos);
    if (pos = nil) then writeln('El destino solicitado no se encuentra disponible')
    else ImprimirDestino(pos^.dato);
End;

{Buscar minimo}
procedure verDestMin(a:arbolDestinos; var min:destino);
begin
	if(a<>nil)then begin
		min:=a^.dato;
		verDestMin(a^.HI,min);
	end;
end;

procedure DestinoMasCercano (a: arbolDestinos);
var min: destino;
begin
    min.distancia:= -1;
    verDestMin(a,min);
    if (min. distancia <> -1) then ImprimirDestino(min)
    else writeln('No se han cargado datos aun');
end;


var aN, aD, pos: arbolDestinos;
    a, b: string;
    d: destino;
    n: integer;
Begin
    writeln('Escriba 0 para Inicializar las estructuras: ');
    readln(a);
    if (a = '0') then 
    begin
        InicializarEstructuras(aN,aD);
        repeat
            writeln('---------------------------------------------------');
            writeln('Precione 1 para cargar un destino');
            writeln('Precione 2 para Imprimir todos los destinos');
            writeln('Precione 3 para buscar un destino e Imprimir toda su informacion');
            writeln('Precione 4 para buscar e informar el destino mas cercano ');
            writeln('Precione 5 para agregar pasajes vendidos a un destino ');
            writeln('Precione 6 para finalizar');
            writeln('---------------------------------------------------');
            write('Ingrese un numero: ');
            readln(a);
            writeln('---------------------------------------------------');
            if (a = '1') then 
            begin
                LeerDestino(d);
                insertarNombres(aN,d);
                insertarDistancia(aD,d);
            end;
            if (a = '2') then 
            begin
                enOrden(aN);
            end;
            if (a = '3') then 
            begin
                Buscar(aN);
            end;
            if (a = '4') then 
            begin   
                DestinoMasCercano(aD);
            end;
            if (a = '5') then 
            begin
				pos:=nil;
                write('Destino al que le quiere agregar pasajes: ');
                readln(b);
                buscarPos(aN,b,pos);
                if (pos <> nil) then 
                begin
                    write('Cantidad de pasajes que desea agregar: ');
                    readln(n);
                    pos^.dato.cantPasajes:= pos^.dato.cantPasajes + n;
                end
                else writeln ('El destino no se encuentra disponible');
            end;
        until (a = '6');
        writeln('Se ha finalizado el programa');
    end;
End.
