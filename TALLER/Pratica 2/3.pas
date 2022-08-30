{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}
program tre;
type
lista = ^nodo;
nodo = record
	numero:integer;
	sig:lista;
end;
procedure crearNodo (var l:lista; num:integer);
var
	nuevo:lista; anterior, act:lista;
begin	
	new(nuevo);
	nuevo^.numero:=num;
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
procedure a (var l:lista);
var
	num:integer;
begin
	Randomize;
	num:=random(10);
	writeln(num);
	crearNodo(l, num);
	if (num <> 0) then
		a(l);
end;
procedure impL (l:lista);
begin
	if (l <> nil) then begin
		write('|');
		write(l^.numero);
		write('|');
		l:=l^.sig;
		impL(l);
	end;
end;
procedure bc (l:lista; var min:integer; var max:integer);
begin
	if (l <> nil) then begin
		writeln(l^.numero);
		if (l^.numero < min) then
			min:=l^.numero;
		writeln(min);
		if (l^.numero > max) then
			max:=l^.numero;
		writeln(max);	
		l:=l^.sig;
		bc(l, min, max);
	end;
end;
procedure d (l:lista; var ok:boolean; bus:integer);
begin
	if (l <> nil) and (l^.numero <> bus) then begin
			l:=l^.sig;
			c(l,ok, bus);
	end;
	if (l <> nil) and (l^.numero = bus)then begin		
		ok:=true;
	end;
end;
var
	l:lista; max, min, bus:integer; f:boolean;
begin
	Randomize;
	l:=nil;
	a(l);
	max:=-1; min:=999;
	bc(l, min, max);
	writeln();
	writeln ('maximo:',max,' minimo:', min);
	impL(l);
	bus:=7;
	f:=false;
	c(l,f, bus);
	writeln(f);
end.
