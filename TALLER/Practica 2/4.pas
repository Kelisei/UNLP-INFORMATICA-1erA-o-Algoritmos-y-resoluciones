{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program tre;
type
	ENTEROS = array [1..20] of integer;
procedure a (var v:ENTEROS; var i:integer);
begin
	if (i < 20) then begin
		i:=i+1;
		v[i]:=random(100);
		a(v, i);
	end;
end;
procedure b (v:ENTEROS; var i:integer; var max:integer);
begin
	if (i < 20) then begin
		i:=i+1;
		if (v[i] > max) then max:=v[i];
		b(v, i, max);
	end;
end;
{function c (v: ENTEROS; i:integer; var tracker:integer):integer;
begin
	if (i = 20) then begin
		tracker:=tracker+v[i];
		writeln(tracker);
		c:=v[i]
	end
	else begin
		i:=i+1;
		tracker:=tracker+v[i];
		writeln(tracker);
		c:=v[i]+ c(v, i, tracker);
	end;
end;}
function c (v: ENTEROS; i:integer):integer;
begin
	if (i = 20) then 
		c:=v[i]
	else begin
		i:=i+1;
		c:=v[i]+ c(v, i);
	end;
end;
var
	v:enteros; max, suma, tracker, i:integer; 
begin
	Randomize();
	i:=0;
	a(v, i);
	for i:= 1 to 20 do begin
		writeln(v[i]);
	end;
	i:=0;
	max:=-1;
	b(v, i, max);
	write('maximo: ', max);
	i:=0;
	suma:=c(v,i);
	write(' suma:',suma);
end.
