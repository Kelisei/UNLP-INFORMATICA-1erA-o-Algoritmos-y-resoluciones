{4.- Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Se pide:
a)	Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, 
* asiento, monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra 
* de forma ascendente.}
program cuatro;
const 
	dimF=7;
type
	dias = 1..dimF;
	infoGuardar = record
		codigo:integer;
		asiento:integer;
		monto:real;
	end;
	lista = ^nodo;
	nodo = record
		dato:infoGuardar;
		sig:lista;
	end;
	vector = array [dias] of lista;
	
	infoB = record
		codigo:integer;
		cant:integer;
	end;
	listaB = ^nodoB;
	nodoB = record
		dato: infoB;
		sig:listaB;
	end;
{a}
procedure incisoA (var v:vector);
var
	n:infoGuardar; d:dias;
	procedure leer (var n:infoGuardar; var d:dias);
	begin
		writeln('Codigo');
		readln(n.codigo);
		if (n.codigo <> 0) then begin
			writeln('Asiento');
			readln(n.asiento);
			writeln('Monto');
			readln(n.monto);
			writeln('Dia');
			readln(d);
		end;
	end;
	procedure insertar (var l:lista; n:infoGuardar);
	var
		nue, ant, act:lista;
	begin
		writeln('Agregando *debug*');
		new(nue); nue^.dato:=n; nue^.sig:=nil; 
		ant:=l; act:=l;
		writeln('Dato del nuevo: *debug*',nue^.dato.codigo);
		while (act <> nil) and (act^.dato.codigo < nue^.dato.codigo) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = ant) then l:=nue
		else ant^.sig:=nue;
		nue^.sig:=act;
	end;
	procedure inicializarVector (var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to 8 do
			v[i]:=nil;
	end;
begin
	inicializarVector(v);
	leer(n, d);
	while (n.codigo <> 0) do begin
		insertar(v[d], n);
		writeln('Agregao *debug*');
		leer(n, d);
	end;
end;
{b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por 
* código de obra de forma ascendente.}
procedure incisoB (v:vector; var l:listaB);
var
	min:infoGuardar; var u:listaB; actual:infoB;
	procedure agregarAlFinal(var l:listaB; var u:listaB; n:infoB);
	var
		nue:listaB;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
		writeln(u^.dato.codigo);
	end;
	procedure minimo(var v:vector; var min:infoGuardar);
	var
		posMin:integer; i:integer;
	begin
		posMin:=-1; min.codigo:=9999;
		for i:= 1 to dimF do
			if (v[i] <> nil) and (v[i]^.dato.codigo < min.codigo) then begin
				min:=v[i]^.dato;
				posMin:=i;
			end;
		if (posMin <> -1) then
			v[posMin]:=v[posMin]^.sig;
	end;
begin
	l:=nil;
	writeln('Minimo *debug*'); 
	minimo(v, min);
	while(min.codigo <> 9999) do begin
		writeln('While superior *debug*');
		actual.codigo:=min.codigo; actual.cant:=0;
		while(min.codigo <> 9999) and (min.codigo = actual.codigo) do begin
			actual.cant:=actual.cant+1;
			writeln('Minimo|Codigo de minimo actual: *debug*', min.codigo); 
			minimo(v, min);
		end;
		agregarAlFinal(l, u, actual);
	end;
end;
{c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)}
procedure incisoC(l:listaB);
begin
	if (l <> nil) then begin
		writeln('Codigo en la lista (inciso c):',l^.dato.codigo);
		writeln('Ventas en la lista (inciso c):',l^.dato.cant);
		incisoC(l^.sig);
	end;
end;
var
	v:vector; l:listaB;
begin
	incisoA(v);
	incisoB(v, l);
	incisoC(l);
end.
