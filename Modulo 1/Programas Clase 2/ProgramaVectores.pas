program Arreglos;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



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

{-----------------------------------------------------------------------
           MAXIMO - DEVUELVE EL MAXIMO NUMERO DE VECTOR          }
procedure Maximo (v: vector; act, dimL: dim; var max: integer); 
begin
	if (act <= dimL) then 
	begin
		if (v[act] > max) then max:= v[act];
		Maximo(v, act+1, dimL, max);
	end;
end;
	


{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL: dim;
   max: integer;
begin
	 max:= -1;
     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     Maximo(v,1,dimL,max);
     writeln('El numero mas grande es el ', max);
     

end.
