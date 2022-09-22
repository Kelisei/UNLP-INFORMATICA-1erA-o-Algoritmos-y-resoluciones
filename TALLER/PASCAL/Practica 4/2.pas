
{2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de 
*película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
*y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
a.Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de 
*género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
b.Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las 
*películas almacenadas ordenadas por código de película.}
program dois;
type
	subr1= 1..8;
	pelicula = record
		codigo:integer;
		genero:subr1;
		promedio:real;
	end;
	peliculaGuardada = record
		codigo:integer;
		promedio:real;
	end;
	lista=^nodo;
	nodo = record
		dato:peliculaGuardada;
		sig:lista;
	end;
	arrLista = array [subr1] of lista;
procedure a (var aL:arrLista);
var 
	n:pelicula; nE:peliculaGuardada; i:integer;
	{Rutinas encapsuladas}
	procedure leer(var n:pelicula);
	begin
		writeln('ingrese codigo de pelicula');
		readln (n.codigo);
		if (n.codigo <> -1) then begin
			writeln('ingrese genero');
			readln (n.genero);
			writeln('ingrese puntaje promedio');
			readln (n.promedio);
		end;
	end;
	procedure insertar(var l:lista; n:peliculaGuardada);
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
begin
	for i:= 1 to 8 do
		aL[i]:=nil;
	leer(n);
	while (n.codigo <> -1) do begin
		nE.codigo:=n.codigo;
		nE.promedio:=n.promedio;
		insertar(aL[n.genero], nE);
		leer(n);
	end;
end;
procedure b (al:arrLista; var l:lista);
var
	min:peliculaGuardada; u:lista;
	procedure agregarAlFinal(var l:lista; var u:lista; n:peliculaGuardada);
	var
		nue:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
	procedure minimo (var al:arrLista; var min:peliculaGuardada);
	var
		posMin, i:integer; 
	begin
		writeln('Entro a minimo');
		posMin:=-1; min.codigo:=9999;
		for i:= 1 to 8 do
			if (al[i] <> nil) and (al[i]^.dato.codigo < min.codigo) then begin
				writeln('i:', i);
				writeln(al[i]^.dato.codigo);
				min:=al[i]^.dato;
				posMin:=i;
				writeln('*Accediendo ', al[i]^.dato.codigo);
			end;
		writeln(posMin);
		if (posMin <> -1) then begin
			writeln('Moviendo nodo del indice ', i);
			al[posMin]:=al[posMin]^.sig;		
		end;
		writeln('Saliendo minimo');	
	end;
begin
	l:=nil; u:=nil;
	writeln('Minimo');
	minimo(aL, min);
	while (min.codigo <> 9999) do begin
		writeln('Agregar');		
		agregarAlFinal(l, u, min);
		writeln('Minimo');
		minimo(aL, min);
	end;
end;
var
	aL:arrLista; l,aux:lista;
begin
	a(aL);
	b(aL, l);
	aux:=l;
	while aux <> nil do begin
		writeln(aux^.dato.codigo);
		aux:=aux^.sig;
	end;
end.
