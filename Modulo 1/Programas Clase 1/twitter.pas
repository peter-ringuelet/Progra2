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

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}
	Tweet2 = RECORD
		mensaje: string;
		esRetweet: boolean;
	end;
	
	listaTweets2 = ^nodoTweet;
	nodoTweet = RECORD
		datos: Tweet2;
		sig: listaTweets2;
	end;
	
	usuario = RECORD
		codigoUsuario: integer;
		nombreUsuario: string;
		Tweets: listaTweets2;
	end;
	
	listaUsuarios = ^nodoUsuarios;
	nodoUsuarios = RECORD
		datos: usuario;
		sig: listaUsuarios;
	end;
     

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
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';

     t.codigoUsuario := random(11);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := v[t.codigoUsuario];
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(11);
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


{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) do begin
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


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     listaOrdenada := nil;
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.dato);
          lT := lT^.sig;
     end;
end;

procedure CopiarArreglo (t: Tweet; var act: Tweet2);
begin
	act.mensaje:= t.mensaje;
	act.esRetweet:= t.esRetweet;
end;

Procedure agregarAdelanteTweets(var l: listaTweets2; t: Tweet2);
var
   aux: listaTweets2;
begin
     new(aux);
     aux^.datos := t;
     aux^.sig := l;
     l:= aux;
end;

{agregarAtras - Agrega atras manteniendo el orden }
procedure agregarAtras (var lM: listaUsuarios; m: usuario);
var nue, act, ant: listaUsuarios;
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

procedure CargarListaDeListas (l: listaTweets; var lPrincipal: listaUsuarios);
var lSecundaria: listaTweets2; act, ant: integer; nomAct, nomAnt: string; secundariaAct: Tweet2; principal: usuario; 
begin
	while (l <> nil) do
	begin
		act:= l^.dato.codigoUsuario;
		ant:= act;
		nomAct:= l^.dato.nombreUsuario;
		nomAnt:= nomAct;
		lSecundaria:= nil;
		while (ant = act) and (l <> nil) do
		begin
			CopiarArreglo(l^.dato, secundariaAct);
			agregarAdelanteTweets(lSecundaria, secundariaAct);
			l:= l^.sig;
			if (l <> nil) then
			begin
				ant:= act;
				act:= l^.dato.codigoUsuario;
				nomAnt:= nomAct;
				nomAct:= l^.dato.nombreUsuario;
			end;
		end;
		principal.codigoUsuario:= ant;
		principal.nombreUsuario:= nomAnt;
		principal.Tweets:= lSecundaria;
		//agregarAdelanteMarcas(lM, m);
		agregarAtras(lPrincipal, principal);
	end;
	writeln('La lista de listas se ha cargado con exito.');
end;


procedure Reporte (lPrincipal: listaUsuarios);
begin
	while (lPrincipal <> nil) do 
	begin
		writeln('Nombre de usuario: ', lPrincipal^.datos.nombreUsuario, '(', lPrincipal^.datos.codigoUsuario, ')' ,': ');
		writeln;
		while (lPrincipal^.datos.Tweets <> nil) do
		begin
			writeln('				', lPrincipal^.datos.Tweets^.datos.mensaje, '  ', lPrincipal^.datos.Tweets^.datos.esRetweet);
			lPrincipal^.datos.Tweets:= lPrincipal^.datos.Tweets^.sig;
		end;
		lPrincipal:= lPrincipal^.sig;
	end;
end;

var
   l, l_ordenada: listaTweets; lU: listaUsuarios;
begin
     Randomize;
	lU:= nil;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);

     {Completar el programa}
	CargarListaDeListas(l_ordenada,lU);
	writeln('Presione una tecla para ver un reporte: ');
	readln;
	Reporte(lU);
     writeln('Fin del programa');
     readln;
end.
