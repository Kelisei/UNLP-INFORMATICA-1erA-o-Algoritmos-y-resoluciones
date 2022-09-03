{3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}
program xd;
type
	alumno = record
		anho:integer;
		dni:integer;
		legajo:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:alumno;
		hi:arbol;
		hd:arbol;
	end;
procedure aa {a} (var a: arbol);
var
	n:alumno;
//----------
	procedure leer (var n: alumno); begin
		writeln('LEYENDO LEGAJO');
		readln (n.legajo);
		{n.legajo:=random(10)-1;
		writeln('LEGAJO DE ', n.legajo);}
		if (n.legajo <> -1) then begin
			{writeln('LEYENDO DNI');
			readln (n.dni);}
			n.dni:=random(100);
			writeln('DNI DE ', n.dni);
			{writeln('LEYENDO ANHO');
			readln (n.anho);}
			n.anho:=2009+random(100);
			writeln('INGRESO EN ', N.ANHO);
		end;
	end;
	procedure crearArbol(var a:arbol; n:alumno);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=n; a^.hi:=nil; a^.hd:=nil;
		end
		else begin
			if (n.legajo < a^.dato.legajo) then
				crearArbol(a^.hi, n)
			else crearArbol(a^.hd, n);
		end;
	end;
begin
	leer(n);
	while (n.legajo <> -1) do begin
		if (n.anho >= 2010) then
			crearArbol(a, n)
		else writeln('SE INGRESO ANTES DE 2010');
		leer(n);
	end;
end;
//--------
procedure b (a:arbol); 
var
	l:integer;
	procedure informar(a:arbol; l:integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.legajo <l) then begin
				writeln ('ANHO DE INGRESO:',a^.dato.anho);
				writeln ('DNI:',a^.dato.dni);
				informar(a^.hi, l);
				informar(a^.hd, l);
			end
			else
				informar(a^.hi, l);
		end;
	end;
begin
	writeln('INGRESE LEGAJO PARA VER LOS MENORES');
	readln(l);
	informar(a, l);
end;
//--------
procedure c (a:arbol); 
var
    r1,r2:integer;
    procedure informar(a:arbol; r1:integer; r2:integer);
    begin
        if (a <> nil) then begin
            if (r1 < a^.dato.legajo) then 
				informar(a^.hi, r1, r2);
            if (r1 <= a^.dato.legajo) and (r2 >= a^.dato.legajo) then
				writeln(a^.dato.legajo, ' ');
			informar(a^.hd, r1, r2);
        end;
    end;
begin
    writeln('INGRESE 2 (DOS) NUMEROS PARA VER LOS QUE ESTEN ENTRE ELLOS (EL PRIMERO MENOR QUE EL SEGUNDO)');
    readln(r1); readln(r2);
    informar(a, r1, r2);
end;
procedure d (a:arbol; var maxDni:integer); 
    procedure maxEdadRec2(A: arbol; var max: integer);
	begin
	  if(A <> nil) then begin
		if(A^.dato.dni > max) then
		  max:= A^.dato.dni;
		maxEdadRec2(A^.HI, max);
		maxEdadRec2(A^.HD, max);
	  end;
	end;
begin	
	maxDni:=-1;
	maxEdadRec2(a, maxDni);
	writeln('DNI MÁS GRANDE:',maxDni);
end;
procedure e (a:arbol);
	function contarImpares (a:arbol):integer;
	begin
		if (a = nil) then
			contarImpares:=0
		else if (a^.dato.legajo mod 2 <> 0) then
			contarImpares:= 1+contarImpares(a^.hd)+contarImpares(a^.hi)
		else
			contarImpares:=contarImpares(a^.hd)+contarImpares(a^.hi);
		end;
begin
	if (a = nil) then writeln ('Sin Elementos')
	else writeln ('Hay ', contarImpares(a), ' miembro/s ');
end;
var
	a:arbol; maxDni:integer;
begin
	randomize();
	aa(a);
	if (a <> nil) then begin
		//b(a);
		//c(a);
		d(a, maxDni);
	end
	else 
		writeln('No hay elementos!');
end.
