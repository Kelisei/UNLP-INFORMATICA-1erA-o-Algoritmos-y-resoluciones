{4.	Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
* Se desea procesar la información de una semana. Implementar un programa que:}
program four;
const
	dimF = 7;
type
	semana = 1..7;
	
	infoLeer = record 
		dia:semana;
		codigo:integer;
		asiento:integer;
		monto:integer;
	end;
	infoGuardar = record
		codigo:integer;
		asiento:integer;
		monto:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:infoGuardar;
		sig:lista;
	end;
	vector = array [1..dimF] of lista;
	
	infoObra = record
		ventas:integer;
		codigo:integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato:infoObra;
		sig:lista2;
	end;
{a.	Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la 
* obra, asiento y monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por 
* código de obra de forma ascendente.}
procedure a (var v:vector);
var
	x:infoLeer; n:infoGuardar;
	procedure leer (var n:infoLeer);
	begin
		writeln('Introduzca el codigo');
		readln (n.codigo);
		if (n.codigo <>  0) then begin
			writeln('Introduzca el dia');
			readln(n.dia);
			writeln('Introduzca el asiento');
			readln(n.asiento);
			writeln('Introduzca el monto');
			readln(n.monto);
		end;
	end;
	procedure insertar(var l:lista; n:infoGuardar);
	var
		nue, act, ant:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil; act:=l; ant:=l;
		while (act <> nil) and (act^.dato.codigo < nue^.dato.codigo) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = ant) then L:=nue
		else ant^.sig:=nue;
		nue^.sig:=act;
	end;
	procedure armarDato (x:infoLeer; var n:infoGuardar);
	begin
		n.codigo:=x.codigo;
		n.asiento:=x.asiento;
		n.monto:=x.monto;
	end;
	procedure inicializarVector (var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to dimF do
		v[i]:=nil;
	end;
begin
	inicializarVector(v);
	leer(x);
	while (x.codigo <> 0) do begin
		armarDato(x,n);
		insertar(v[x.dia], n);
		leer(x);
	end;
end;
{b.	Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada 
* por código de obra de forma ascendente.}
procedure b (v:vector; l:lista2);
var
	min:infoGuardar; actual:infoObra; u:lista2;
	procedure minimo(var v:vector; var min:infoGuardar);
	var 
		posMin, i:integer;
	begin
		min.codigo:= 9999; posMin:=-1;
		for i:=1 to dimF do
			if (v[i]^.dato.codigo < min.codigo) then begin
				min:=v[i]^.dato;
				posMin:=i;
			end;
		if (posMin <> -1) then
			v[posMin]:=v[posMin]^.sig;
	end;
	procedure agregarAlFinal(var l:lista2; var u:lista2; n:infoObra);
	var
		nue:lista2;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		writeln('*debug*dato de nue:',nue^.dato.codigo);
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
begin
	minimo(v, min);
	while (min.codigo <> 9999) do begin
		actual.codigo:=min.codigo;
		actual.ventas:=0;
		while (min.codigo <> 9999) and (actual.codigo = min.codigo) do begin
			actual.ventas:=actual.ventas+1;
			minimo(v, min);
		end;
		agregarAlFinal(l, u, actual);
	end;
end;
var
	v:vector; l:lista2;
BEGIN
	a(v);
	b(v,l);
END.


