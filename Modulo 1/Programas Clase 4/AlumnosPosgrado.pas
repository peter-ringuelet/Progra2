program AlumnosPosgrado;
uses crt;
const FIN = 'ZZZ';
type
    alumno = RECORD
        nombre: string;
        apellido: string;
        dni: integer;
    end;
    
    arbol = ^nodoArbol;
    nodoArbol = RECORD 
        dato: alumno;
        HI: arbol;
        HD: arbol;
    end;
    
procedure leerAlumno (var alu: alumno);
begin
    writeln('------------------------------------');
    write('Nombre: ');
    readln(alu.nombre);
    if (alu.nombre <> FIN) then 
    begin
        write('Apellido: ');
        readln(alu.apellido);
        write('DNI: ');
        readln(alu.dni);
    end;
end;

procedure insertar(var a:arbol; alu:alumno);
Begin
  if(a = nil)then
    begin
         new(a);
         a^.dato:=alu;
         a^.HI:=nil;
         a^.HD:=nil;

    end
  else
    if(alu.dni > a^.dato.dni)then
        insertar(a^.HD,alu)
  else
    if(alu.dni < a^.dato.dni)then
      insertar(a^.HI,alu);
End;

procedure cargarAlumnos (var a: arbol; alu: alumno);
begin
    if (alu.nombre <> FIN) then 
    begin
        clrscr;
        leerAlumno(alu);
        if (alu.nombre <> FIN) then 
        begin
            write('Precione enter para inscribir al alumno: ');
            insertar(a,alu);
            readkey;
            clrscr;
            cargarAlumnos(a,alu);
        end
        else writeln('Se ha finalizado la inscripcion.');
    end;
end;

procedure buscarDNI(a:arbol; num:integer; var pos:arbol);
Begin
	if(a = nil)then
		pos:=pos
	else
		if(a^.dato.dni = num)then
                       pos:=a
        else
		if(a^.dato.dni > num)then buscarDNI(a^.HI,num,pos)
	else
		buscarDNI(a^.HD,num,pos);
End;


procedure imprimirAlumno(a: alumno);
begin
    writeln('------------------------------------');
    writeln('Nombre: ', a.nombre);
    writeln('Apellido: ', a.apellido);
    writeln('DNI: ', a.dni);
end;


Procedure imprimirApellido(a: arbol; apellido: string);
begin
  if ( a <> nil ) then begin
    if (a^.dato.apellido = apellido) then imprimirAlumno(a^.dato);
    imprimirApellido (a^.HI,apellido);
    imprimirApellido (a^.HD,apellido);
  end;
end;

procedure Imprimir(a: arbol);
Begin
    if (a <> nil) then 
    Begin
        Imprimir(a^.HI);
        imprimirAlumno(a^.dato);
        Imprimir(a^.HD);
    end;
end;


var 
    num: integer;
    a, pos: arbol;
    str: string;
    alu: alumno;
    
Begin
    a:= nil;
    pos:= nil;
    cargarAlumnos(a,alu);
    Imprimir(a);
    writeln('------------------------------------');
    write('DNI a buscar: ');
    readln(num);
    buscarDNI(a,num,pos);
    if (pos = nil) then writeln('El DNI ', num, ' no se encuentra disponible')
    else imprimirAlumno(pos^.dato);
    writeln('------------------------------------');
    write('Apellido a buscar: ');
    readln(str);
    imprimirApellido(a,str);
End.