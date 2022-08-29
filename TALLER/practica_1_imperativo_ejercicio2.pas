{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
program ordenacion;
const
	tope = 300;
type
	oficina = record
		codigo:integer;
		dni:integer;
		expensa:real;
	end;
	vector = array [1..tope] of oficina;
procedure leerVentas {a} (var v:vector; var dimL:integer);
var
	aux: integer;
begin
	aux:=random(1000); dimL:=0;
	while (dimL < 300) and (aux <> -1) do begin
		dimL:=dimL+1;
		{v[dimL].codigo:=aux;
		readln(v[dimL].dni);
		readln(v[dimL].expensa);}
		v[dimL].dni:=random(1000);
		v[dimL].expensa:=random(1000);
		aux:= (100+random(60))div 10;
	end;
end;
procedure mostrarVector {debug} (v:vector; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do 
		writeln('codigo ', v[i].codigo, ' dni ', v[i].dni);
	writeln('|--------------------|');
end;
procedure ordenarInsercion {b} (var v:vector; dimL:integer);
var
	i, j:integer; actual:oficina;
begin
	for i:= 2 to dimL do begin
		actual:=v[i];
		j:=i-1;
		while (j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;
procedure ordenarSeleccion {b} (var v:vector; dimL:integer);
var
	i, j, p:integer; item:oficina;
begin
	for i:= 1 to dimL-1 do begin
		p:=i;
		for j:= i+1 to dimL do 
			if (v[j].codigo < v[p].codigo) then p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
	end;
end;
var
	v:vector; dimL:integer;
begin
	leerVentas(v, dimL);
	mostrarVector(v, dimL);
	ordenarInsercion(v, dimL);
	mostrarVector(v, dimL);
	ordenarSeleccion(v, dimL);
end.
