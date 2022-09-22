{1.	 Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a.	Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes. Para cada mes, los préstamos deben quedar ordenados por ISBN. La lectura de los préstamos finaliza con ISBN -1.
b.	Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
c.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN.
d.	Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
e.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó durante el año 2021.
f.	Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.}
program merge;
const 
	tope=12;
type 
	subr1= 1..31;
	subr2= 1..tope;
	prestamo = record
		ISBN:longint;
		numero:integer;
		cant:integer;
		dia: subr1;
		mes: subr2;
	end;
	prestamosTotal = record
		ISBN:longint;
		prestamos:integer;
	end;
	lista = ^nodo;
	nodo = record
		dato:prestamo;
		sig:lista;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato:prestamosTotal;
		sig:lista2;
	end;
	arrLista = array [subr2] of lista;
procedure inicializarLista(var l:lista);
begin
	l:=nil;
end;
procedure a (var aL:arrLista);
var
	n:prestamo; i:integer;
	{Rutinas encapsuladas}
	procedure leer(var n:prestamo);
	begin
		writeln('PONGA ISBN');
		readln (n.ISBN);
		if (n.ISBN <> -1) then begin
			writeln('PONGA NUMERO');
			readln (n.numero);
			writeln('PONGA CANT');
			readln (n.cant);
			writeln('PONGA DIA');
			readln (n.dia);
			writeln('PONGA MES');
			readln (n.mes);
		end;
		writeln('*debug*mes leido:',n.mes);
	end;
	procedure insertar (var l:lista; n:prestamo);
	var
		nue, act, ant:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil; act:=l; ant:=l;
		while (act <> nil) and (act^.dato.ISBN < nue^.dato.ISBN) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = ant) then L:=nue
		else ant^.sig:=nue;
		nue^.sig:=act;
	end;
begin
	leer(n);
	for i:= 1 to tope do inicializarLista(al[i]);
	while (n.ISBN <> -1) do begin //!LOG--->Error pelotudo, puse if en vez de while acá
		writeln('*debug*Entrando a insertar en mes:',n.mes);
		insertar(aL[n.mes], n);
		writeln('*debug*:Leyendo');
		leer(n);
	end;
end;
procedure b (aL:arrLista);
var
	i:integer;
	procedure imprimir (aL:arrLista; var i:integer);
	begin
		if (aL[i] <> nil) then begin
			writeln('Informando ISBN:', aL[i]^.dato.ISBN);
			writeln('Informando numero:', aL[i]^.dato.numero);
			aL[i]:=aL[i]^.sig;
			imprimir(aL, i);
		end
		else if (i < tope) then begin
			i:=i+1;
			imprimir(aL, i);
		end;
	end;
begin
	i:=1;
	imprimir(aL, i);
end;
procedure minimo(var aL:arrLista; var min:prestamo); {C y D}
	var
		i, posMin:integer;
	begin
		min.ISBN:=9999; posMin:=-1;
		writeln('*debug*haciendo minimo');
		for i:= 1 to tope do 
			if (aL[i] <> nil) and (aL[i]^.dato.ISBN < min.ISBN) then
			begin
				min:=aL[i]^.dato;
				posMin:=i;
				writeln('*debug*dato minimo sobreescrito ', min.ISBN);
			end;
		if (posMin <> -1) then begin
			writeln('*debug*moviendo la lista ', posMin);
			aL[posMin]:=aL[posMin]^.sig;
		end;
	end;
procedure c(al:arrLista; var l:lista); {MERGE}
var
	min:prestamo; u:lista;
	{Rutinas encapsuladas}
	procedure agregarAlFinal(var l:lista; var u:lista; n:prestamo);
	var
		nue:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		writeln('*debug*dato de nue:',nue^.dato.ISBN);
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
begin
	inicializarLista(l);
	minimo(aL, min);
	while(min.ISBN <> 9999) do begin
		agregarAlFinal(l, u, min);
		minimo(aL, min);
	end;
end;
procedure d (l:lista);
begin
	writeln('*debug* en d');
	if (l <> nil) then begin
		writeln(l^.dato.ISBN);
		d(l^.sig);
	end;
end;
{procedure e (var l2:lista2; l:lista);
var
	aux:longint; contador:integer; u:lista2; n:prestamosTotal;
begin
	while(l <> nil) do begin
		writeln('*debug* Taking ISBN:', l^.dato.ISBN);
		aux:=l^.dato.ISBN;
		contador:=0;
		while (l<>nil) and(aux = l^.dato.ISBN) do begin
			contador:=contador+1;
			writeln('*debug*',contador);
			l:=l^.sig;
		end;
		writeln('*debug* salio del corte');
		n.ISBN:=aux;
		n.prestamos:=contador;
		agregarAlFinal(l2, u, n);
	end;
end;}
procedure e(var al:arrLista; var l:lista2); {MERGE ACUMULADOR}
var
	u:lista2; actual:prestamosTotal; min:prestamo;
	procedure agregarAlFinal(var l:lista2; var u:lista2; n:prestamosTotal);
	var
		nue:lista2;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		writeln('*debug*dato de nue:',nue^.dato.ISBN);
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
begin
	l:=nil;
	minimo(al, min);
	while (min.ISBN <> 9999) do begin
		actual.ISBN:=min.ISBN; actual.prestamos:=0;
		while (actual.ISBN = min.ISBN) do begin
			actual.prestamos:=actual.prestamos+1;
			minimo(al, min);
		end;
		agregarAlFinal(l, u, actual);
	end;
end;
procedure f (l:lista2);
begin
	if (l <> nil) then begin
		writeln(l^.dato.ISBN);
		writeln(l^.dato.prestamos);
		f(l^.sig);
	end;
end;
var
	aL:arrLista; l:lista; l2:lista2;
begin
	a(aL);
	b(aL);
	c(aL, l);
	if (l = nil) then writeln('No hay elementos')
	else begin 
		writeln('*debug*Doin d');
		d(l);
		writeln('*debug*Doin e');
		e(al, l2);
		writeln('*debug*Doin f');
		f(l2);
	end;
end.

