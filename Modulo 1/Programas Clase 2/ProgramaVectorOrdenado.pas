program VectorOrdenado;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

procedure BusquedaDicotomica (v: vector; x: integer; pri, ult: dim; var pos: dim; var ENCONTRE: boolean);
begin
	pos:= (ult+pri) div 2;
	ENCONTRE:= false;
	if (pri <= ult) then 
	begin
		if (v[pos] = x) then begin
			writeln('Elemento encontrado en la posicion ', pos);
			ENCONTRE:= true;
		end
		else
		begin
			if (v[pos] > x) then BusquedaDicotomica(v,x,pri,ult -1, pos, ENCONTRE)
			else BusquedaDicotomica(v,x, pri + 1, ult, pos, ENCONTRE);
		end;
	end;
end;
		
{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   x: integer;
   pri, pos: dim;
   ENCONTRE: boolean;

begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     x:= 999;
     pri:= 1;
    while (x <> 777) do
    begin
		write('Numero a buscar: ');
		readln(x);
		BusquedaDicotomica(v,x,pri,dimL,pos, ENCONTRE);
		writeln(ENCONTRE);
	end;
     readln;
end.
