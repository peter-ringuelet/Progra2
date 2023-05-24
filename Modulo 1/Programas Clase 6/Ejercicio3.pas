Program ejercicio3;
Uses
     sysutils;
Type
     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: longint;
	      codArea: integer;
          domicilio: string;
          tel: string;
     end;

     listaPedidos = ^nodoLista;
     nodoLista = record
               dato: pedido;
               sig: listaPedidos;
     end;
 
     
{-------------------------------------------------------------------------------
                    Estructuras Nuevas                                          }

    listaDNI = ^nodoDNI;
    nodoDNI = RECORD 
        dato: longint;
        sig: listaDNI;
    end;
    
    registroPedidos = RECORD
        codArea: integer;
        cant: integer;
        dni: listaDNI;
    end;
    
    arbolPedidos = ^nodoPedidos;
    nodoPedidos = RECORD
        dato: registroPedidos;
        HI: arbolPedidos;
        HD:arbolPedidos;
    end;
    
{-------------------------------------------------------------------------------
                       Procesos Nuevos                                          }  
procedure agregarAdelanteDNI(var l: listaDNI; d:longint);
var
  aux: listaDNI; 
begin
  new(aux);
  aux^.dato := d;
  aux^.sig := l;
  l:= aux;
end;

procedure insertarVenta(var a:arbolPedidos; d: listaPedidos);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato.codArea:= d^.dato.codArea;
         a^.dato.cant:= 1;
         a^.dato.dni:= nil;
         agregarAdelanteDNI(a^.dato.dni,d^.dato.dni);
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(d^.dato.codArea> a^.dato.codArea)then
        insertarVenta(a^.HD,d)
  else
    if(d^.dato.codArea < a^.dato.codArea)then
      insertarVenta(a^.HI,d)
  else Begin
        agregarAdelanteDNI(a^.dato.dni,d^.dato.dni);
        a^.dato.cant:= a^.dato.cant +1;
    end;
End;

procedure cargarArbolVentas(var a: arbolPedidos; l: listaPedidos);
var act: listaPedidos; 
Begin
    act:= l;
    while (act <> nil) do Begin
        insertarVenta(a,act);
        act:= act^.sig;
    end;
end;


Procedure minimo(a: arbolPedidos; var min: integer);
begin
  if ( a <> nil ) then begin
    minimo (a^.HD,min);
    if (a^.dato.cant < min) then begin
        min:= a^.dato.cant;
    end;
    minimo (a^.HI,min);
  end;
end;

procedure informarMinimos (a: arbolPedidos; min: integer);
begin
  if ( a <> nil ) then begin
    informarMinimos (a^.HD,min);
    if (a^.dato.cant = min) then writeln('Codigo de area con menor cantidad de pedidos de servicio: ', a^.dato.codArea);
    informarMinimos (a^.HI,min);
  end;
end;
procedure imprimirDNI(l:listaDNI);
var act: listaDNI;
begin
    act:= l;
    while (act<>nil) do begin 
        writeln(l^.dato);
        act:= act^.sig;
    end;
end;
        
procedure busquedaAcotadaDNI(a: arbolPedidos; inf:integer; sup:integer); 
begin
  if (a <> nil) then
    if (a^.dato.codArea >= inf) then
      if (a^.dato.codArea <= sup) then begin
        imprimirDNI(a^.dato.dni);
        busquedaAcotadaDNI(a^.HI, inf, sup);
        busquedaAcotadaDNI (a^.HD, inf, sup);
      end
      else
        busquedaAcotadaDNI(a^.HI, inf, sup)
    else
      busquedaAcotadaDNI(a^.HD, inf, sup);
end;

{BUSCAR}
procedure buscar(a:arbolPedidos; num:integer; var pos:arbolPedidos);
Begin
	if(a = nil)then
		pos:=pos
	else
		if(a^.dato.codArea = num)then
                       pos:=a
        else
		if(a^.dato.codArea > num)then buscar(a^.HI,num,pos)
	else
		buscar(a^.HD,num,pos);
End;

procedure imprimirDNIcodArea(a: arbolPedidos);
var pos: arbolPedidos; num: integer; 
begin
    write('De que codigo postal quiere imprimir los codigos DNI: '); readln(num);
    pos:=nil;
    buscar(a,num,pos);
    if (pos = nil) then writeln('El codigo insertado no se encuentra disponible')
    else begin
        while(pos^.dato.dni <> nil) do begin
            writeln(a^.dato.dni^.dato);
            pos^.dato.dni:= pos^.dato.dni^.sig;
        end;
    end;
end;
    
    
{-------------------------------------------------------------------------------}
    
procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
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


function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.codArea := (random(10000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente DNI: ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;

var
   l_inicial: listaPedidos; a: arbolPedidos; min: integer;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     crearLista(l_inicial);
     writeln ('Lista: ');
     imprimirLista(l_inicial);

     {Completar el programa}

     writeln('Fin del programa');
     readln;
     a:= nil;
     cargarArbolVentas(a,l_inicial);
     writeln('Se cargo');
     min:=9999;
     minimo(a,min);
     informarMinimos(a,min);
     busquedaAcotadaDNI(a,1000,2000);
     imprimirDNIcodArea(a);
end.
