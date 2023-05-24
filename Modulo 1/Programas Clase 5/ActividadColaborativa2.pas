program ActividadColaborativa2.pas;
type
    paciente = RECORD
        dni: integer;
        codCiu: integer;
        nomCiu: string;
    end;
    
    conteo = RECORD
        total: integer;
        codCiu: integer;
        nomCiu: string;
    end;
    
    
    listaPacientes = ^nodoPaciente;
    nodoPaciente = RECORD
        dato: paciente;
        sig: listaPacientes;
    end;
    
    arbolCiu = ^nodoCiu;
    nodoCiu = RECORD
        dato: conteo;
        HI: arbolCiu;
        HD: arbolCiu;
    end;
    

    listaDNI = ^nodoDNI;
    nodoDNI = RECORD
        dato: integer;
        sig: listaDNI;
    end;
    
    datos = RECORD
        nomCiu: string;
        codCiu: integer;
        dni: listaDNI;
    end;
    
    arbolCiuDNI = ^nodoCiuDNI;
    nodoCiuDNI = RECORD
        dato: datos;
        HI: arbolCiuDNI;
        HD: arbolCiuDNI;
    end;
    
procedure leerPaciente (var p: paciente);
Begin
    write('DNI: '); readln(p.dni);
    if (p.dni <> -1)  then begin
        write('Codigo de la ciudad: '); readln(p.codCiu);
        write('Nombre de la ciudad: '); readln(p.nomCiu);
    end;
end;

procedure agregarAdelante(var l: listaPacientes; d: paciente);
var
  aux: listaPacientes;
begin
  new(aux);
  aux^.dato := d;
  aux^.sig := l;
  l:= aux;
end;

procedure cargarLista (var l: listaPacientes; p: paciente);
Begin
    leerPaciente(p);
    if (p.dni <> -1) then Begin
        agregarAdelante(l,p);
        cargarLista(l,p);
    end;
end;

procedure insertar(var a:arbolCiu; d: paciente);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.nomCiu:=d.nomCiu;
         a^.dato.codCiu:= d.codCiu;
         a^.dato.total:= 1;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d.codCiu > a^.dato.codCiu)then
        insertar(a^.HD,d)
  else
    if(d.codCiu < a^.dato.codCiu)then
      insertar(a^.HI,d)
  else a^.dato.total:= a^.dato.total +1;
End;

procedure cargarArbol (var a: arbolCiu; l: listaPacientes);
var act: listaPacientes;
Begin
    act:= l;
    while (act <> nil) do Begin
        insertar(a,act^.dato);
        act:= act^.sig;
        
    end;
end;

procedure busquedaAcotada(a: arbolCiu; inf:integer; sup:integer; var cant: integer); 
begin
  if (a <> nil) then
    if (a^.dato.codCiu >= inf) then
      if (a^.dato.codCiu <= sup) then begin
        cant:= cant + a^.dato.total;
        busquedaAcotada(a^.HI, inf, sup, cant);
        busquedaAcotada (a^.HD, inf, sup, cant);
      end
      else
        busquedaAcotada(a^.HI, inf, sup, cant)
    else
      busquedaAcotada(a^.HD, inf, sup, cant);
end;
 
 
 
{------------------------------------------------------------------------------
                             PUNTO 2                                            }
 
procedure agregarAdelanteDNI(var l: listaDNI; d: integer);
var
  aux: listaDNI;
begin
  new(aux);
  aux^.dato := d;
  aux^.sig := l;
  l:= aux;
end;

procedure insertarDNI(var a:arbolCiuDNI; d: paciente);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.nomCiu:= d.nomCiu;
         a^.dato.codCiu:= d.codCiu;
         a^.dato.dni:= nil;
         agregarAdelanteDNI(a^.dato.dni,d.dni);
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d.codCiu> a^.dato.codCiu)then
        insertarDNI(a^.HD,d)
  else
    if(d.codCiu < a^.dato.codCiu)then
      insertarDNI(a^.HI,d)
  else agregarAdelanteDNI(a^.dato.dni,d.dni);
End;

procedure cargarArbolDNI (var a: arbolCiuDNI; l: listaPacientes);
var act: listaPacientes;
Begin
    act:= l;
    while (act <> nil) do Begin
        insertarDNI(a,act^.dato);
        act:= act^.sig;
    end;
end;

procedure conteoLista(l: listaDNI; var cant: integer);
var act: listaDNI;
begin
    act:= l;
    while (act <> nil) do
    begin
        cant:= cant + 1;
        act:= act^.sig;
    end;
end;

procedure busquedaAcotadaDNI(a: arbolCiuDNI; inf:integer; sup:integer; var cant: integer); 
begin
  if (a <> nil) then
    if (a^.dato.codCiu >= inf) then
      if (a^.dato.codCiu <= sup) then begin
        conteoLista(a^.dato.dni, cant);
        busquedaAcotadaDNI(a^.HI, inf, sup, cant);
        busquedaAcotadaDNI (a^.HD, inf, sup, cant);
      end
      else
        busquedaAcotadaDNI(a^.HI, inf, sup, cant)
    else
      busquedaAcotadaDNI(a^.HD, inf, sup, cant);
end;



var p: paciente;
    l: listaPacientes;
    a: arbolCiu;
    cant, cant1: integer;
    aDNI: arbolCiuDNI;

Begin
    l:=nil;
    a:=nil;
    aDNI:= nil;
    cant:= 0;
    cant1:= 0;
    cargarLista(l,p);
    writeln('Primer arbol cargado');
    cargarArbol(a,l);
    readln;
    busquedaAcotada(a,1800,1900,cant);
    writeln('Cantidad de personas con COVID positivo entre las ciudades de codigo postal 1800-1900 es: ', cant);
    cargarArbolDNI(aDNI, l);
    writeln('Segundo arbol cargado');
    busquedaAcotadaDNI(aDNI, 1800, 1900,cant1);
    writeln('Cantidad de personas con COVID positivo entre las ciudades de codigo postal 1800-1900 es: ', cant1);
    
End.
    