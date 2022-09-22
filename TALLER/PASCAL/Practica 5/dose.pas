{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), 
la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado}
program dois;
type
	anios = 2010..2018;
	info = record
		patente:string;
		marca:string;
		modelo:string;
		anio:anios;
	end;
	arbol = ^nodo;
	nodo = record
		dato:info;
		hi:arbol;
		hd:arbol;
	end;
	infoArr = record
		patente:string;
		marca:string;
		modelo:string;
	end;
	lista = ^nodoArr;
	nodoArr = record
		dato:infoArr;
		sig:lista;
	end;
	vector = array [anios] of lista;
procedure incisoA(var a:arbol);
var
	n:info;
	procedure leer (var n:info);
	begin
		writeln('patente');
		readln(n.patente);
		if (n.patente <> '-1') then begin
			writeln('marca');
			readln(n.marca);
			writeln('modelo');
			readln(n.modelo);
			writeln('año');
			readln(n.anio);
		end;
	end;
	procedure insertar {a}(var A:arbol; n:info);
	Begin
		if (A = nil) then begin
			new(A);
			A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
		end
		else if (n.patente < A^.dato.patente) then insertar(A^.HI,n)
		else insertar(A^.HD,n)   
	End;
begin
	a:=nil;
	leer(n);
	while(n.patente <> '-1') do begin
		insertar(a , n);
		leer(n);
	end;
end;
Procedure debugA( a : arbol );
begin
   if ( a<> nil ) then begin
		debugA (a^.hi);
		writeln ('Patente:',a^.dato.patente);
		debugA(a^.hd);
   end;
end;
procedure incisoB (a:arbol; var totalMarca:integer);
var
	marca:string;
	function marcada(a:arbol; marca:string):integer;
	begin
		if (a = nil) then marcada:=0
		else begin
			if (a^.dato.marca = marca) then 
				marcada:=1+marcada(a^.hd, marca)+marcada(a^.hi, marca)
			else marcada:=marcada(a^.hd, marca)+marcada(a^.hi, marca);
		end;
	end;
begin
	readln(marca);
	totalMarca:=marcada(a,marca);
	//writeln(totalMarca);
end;
procedure incisoC(a:arbol; var v:vector);
var
	n:infoArr;
	procedure armarDato (x:info; var n:infoArr);
	begin
		n.patente:=x.patente;
		n.marca:=x.marca;
		n.modelo:=x.modelo;
	end;
	procedure agregarAlFinal(var l:lista;n:infoArr);
	var
		nuevo:lista; anterior, act:lista;
	begin	
		new(nuevo);
		nuevo^.dato:=n;
		nuevo^.sig:=nil;
		anterior:=l;
		act:=l;
		while (act <> nil) do begin
			anterior:=act;
			act:=act^.sig;
		end;
		if (l = act) then
			l:=nuevo
		else anterior^.sig:=nuevo;
		nuevo^.sig:=act;
	end;
begin
	if (a <> nil) then begin
		armarDato(a^.dato, n);
		agregarAlFinal(v[a^.dato.anio], n);
		incisoC(a^.hi, v);
		incisoC(a^.hd, v);
	end;
end;
procedure incisoD(a:arbol);
var
	patente:string;
	anioFab:integer;
	function encontrar(a:arbol; patente:string):integer;
	begin
		if (a = nil) then
			encontrar:=-1
		else begin
			if(a^.dato.patente = patente) then
				encontrar:=a^.dato.anio
			else if (patente < a^.dato.patente) then 
					encontrar:= encontrar(a^.hi, patente) 	
			else encontrar:= encontrar(a^.hd, patente);		
		end;
	end;
begin
	writeln('Introduzca una patente');
	readln(patente);
	anioFab:=encontrar(a, patente);
	if (anioFab = -1) then 
		writeln('No ta')
	else writeln('Esta es:', anioFab);
end;
procedure debugC (v:vector);
var
	i:integer;
begin
	for i:=2010 to 2018 do begin
		while(v[i] <> nil) do begin
			writeln('Patente de la lista',v[i]^.dato.patente);
			v[i]:=v[i]^.sig;
		end;
	end;
end;
var
	a:arbol; tM:integer; v:vector; i:integer;
begin 
	incisoA(a);
	debugA(a);
	incisoB(a,tM);
	for i:= 2010 to 2018 do v[i]:=nil;
	incisoC(a, v);
	debugC(v);
	incisoD(a);
end.
