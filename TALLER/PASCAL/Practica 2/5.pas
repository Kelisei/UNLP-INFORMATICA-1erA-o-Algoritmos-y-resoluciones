{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.
}
program faiv;
type
	vector = array [1..100] of integer;
	indice = -1..100;
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
begin
	if (ini<=fin) and (dato <> v[pos]) then begin
		writeln(pos);
		if (dato < v[pos]) then
			fin:=pos-1
		else ini:=pos+1;
		pos:=(ini+fin) div 2;
		busquedaDicotomica(v,ini,fin,dato,pos);
	end;
	if (pos > 0) and (pos < 101)and(dato = v[pos]) then pos:=pos
	else pos:=-1;
end;
procedure a (var v:vector; var i:integer);
begin
	if (i < 100) then begin
		i:=i+1;
		v[i]:=random(100);
		a(v, i);
	end;
end;
procedure ordenar (var v:vector);
var
	i, j:integer; actual:integer;
begin
	for i:= 2 to 100 do begin
		actual:=v[i];
		j:=i-1;
		while (j > 0) and (v[j] > actual) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;
var
	v:vector; i:integer; pri, ult,pos:indice; dato:integer;
begin
	Randomize();
	a(v,i);
	ordenar(v);
	for i:= 1 to 100 do writeln (v[i]);
	pri:=1; ult:=100;
	pos:=(pri+ult)div 2;
	dato:= 77;
	writeln();
	busquedaDicotomica(v, pri, ult, dato, pos);
	writeln('pos:', pos);
end.
