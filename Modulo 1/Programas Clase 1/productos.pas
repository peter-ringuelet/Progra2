Program productos;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;
     
{-----------------------------------------------------------------------
*              NUEVAS ESTRUCTURAS DE DATOS                             }

//---- Productos ----//
	prod = RECORD
		codigo: integer;
		nombre: string;
		anio: 2000..2022;
		precio: real;
	end;
	
	listaProds = ^nodoProds;
	nodoProds = RECORD
		datos: prod;
		sig: listaProds;
	end;

//---- Marcas ----//
	marca = RECORD
		nombre: string;
		productos: listaProds;
	end;
	
	listaMarcas = ^nodoMarcas;
	nodoMarcas = RECORD
		datos: marca;
		sig: listaMarcas;
	end;
	
{----------------------------------------------------------------------}

procedure CopiarArreglo (p: producto; var act: prod);
begin
	act.codigo:= p.codigo;
	act.nombre:= p.nombre;
	act.anio:= p.anio;
	act.precio:= p.precio;
end;

Procedure agregarAdelanteProductos(var l: listaProds; p: prod);
var
   aux: listaProds;
begin
     new(aux);
     aux^.datos := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarAdelanteMarcas(var l: listaMarcas; p: marca);
var
   aux: listaMarcas;
begin
     new(aux);
     aux^.datos := p;
     aux^.sig := l;
     l:= aux;
end;

{agregarAtras - Agrega atras manteniendo el orden }
procedure agregarAtras (var lM: listaMarcas; m: marca);
var nue, act, ant: listaMarcas;
begin
	new(nue);
	nue^.datos:= m;
	nue^.sig:=nil;
	if (lM = nil) then lM:= nue
	else
	begin
			act:= lM;
	ant:=act;
		while ( act<> nil) do
		begin
			ant:= act;
			act:= act^.sig;
		end;
		ant^.sig:= nue;
		nue^.sig:=nil;
	end;
end;
{-----------------------------------------------------------------------
*                   CARGAR LISTA DE LISTAS                             }
procedure CargarListaDeListas (l: listaProductos; var lM: listaMarcas);
var lP: listaProds; act, ant: string; prodAct: prod; m: marca; 
begin
	while (l <> nil) do
	begin
		act:= l^.dato.marca;
		ant:= act;
		lP:= nil;
		while (ant = act) and (l <> nil) do
		begin
			CopiarArreglo(l^.dato, prodAct);
			agregarAdelanteProductos(lP, prodAct);
			l:= l^.sig;
			if (l <> nil) then
			begin
				ant:= act;
				act:= l^.dato.marca;
			end;
		end;
		m.nombre:= ant;
		m.productos:= lP;
		//agregarAdelanteMarcas(lM, m);
		agregarAtras(lM, m);
	end;
	writeln('La lista de listas se ha cargado con exito.');
end;
			

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



	
{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;
   
   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure ProductosAbercom (var lM: listaMarcas; var cont: integer);
var act: listaMarcas; act1: listaProds;
begin
	cont:=0;
	act:= lM;
	while (act <> nil) and (act^.datos.nombre <> 'Abercom') do 
	begin
		act:= lM^.sig;
	end;
	if (act <> nil) then
	begin 
		act1:= act^.datos.productos;
		while (act1 <> nil) do
		begin
			if(act1^.datos.precio > 100000) and (act1^.datos.anio >= 2018) and (act1^.datos.anio < 2020) then cont:= cont +1;
			act1:= act1^.sig;
		end;
		if (cont > 0) then writeln('La cantidad de productos de la marca Abercom cuyo precio supera los $100.000 entre los anios 2018 y 2020 es: ', cont)
		else writeln ('Ningun precio de un producto de la marca Abercom supera los $100.000 entre el anio 2018 y 2020');
	end
	else writeln('No se encuentra registrada la marca Abercom');
end;
		
procedure Reporte (lM: listaMarcas);
var act, ant: 2000..2022;
begin
	while (lM <> nil) do 
	begin
		writeln('Marca: ', lM^.datos.nombre, ': ');
		writeln;
		while (lM^.datos.productos <> nil) do
		begin
			act:= lM^.datos.productos^.datos.anio;
			ant:= act;
			writeln('		Anio: ', act, ': ');
			while (lM^.datos.productos <> nil) and (act = ant) do
			begin
				writeln('				', lM^.datos.productos^.datos.codigo, '  ', lM^.datos.productos^.datos.nombre, '  $', lM^.datos.productos^.datos.precio:2:2);
				lM^.datos.productos:= lM^.datos.productos^.sig;
				if (lM^.datos.productos <> nil) then
				begin
					ant:= act;
					act:= lM^.datos.productos^.datos.anio;
				end;
			end;
		end;
		lM:= lM^.sig;
	end;
end;
			
				
			
			

var
   l, act: listaProductos; lM: listaMarcas; cont: integer;
   
begin
     Randomize;
	lM:= nil;
     l:= nil;
     crearLista(l);
     act:= l;
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
     CargarListaDeListas(act,lM);
     ProductosAbercom(lM,cont);
     writeln('Presione una tecla para hacer un informe: ');
     readln;
     Reporte(lM);
end.
