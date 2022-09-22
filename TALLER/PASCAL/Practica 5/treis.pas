{3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y 
* precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que 
* la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..}
program treis;
const
	dimF=10;
	BBC=9999;
type
	rubros = 1..dimF;
	infoGuardar = record
		codigo:integer;
		stock:integer;
		precio:real;
	end;
	arbol = ^nodo;
	nodo = record
		dato:infoGuardar;
		hi:arbol;
		hd:arbol;
	end;
	vector = array [rubros] of arbol;
	datoC = record
		codigo:integer;
		stock:integer;
	end;
	vectorC = array [rubros] of datoC;
	vectorD = array [rubros] of integer;
procedure incisoA (var v:vector);
var
	n:infoGuardar; r:rubros;
	procedure incializarVector (var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to dimF do 
			v[i]:=nil;
	end;
	procedure leer (var n:infoGuardar; var r:rubros);
	begin
		writeln('codigo');
		readln(n.codigo);
		if (n.codigo <> -1) then begin
			writeln('rubro');
			readln(r);
			writeln('stock');
			readln(n.stock);
			writeln('precio');
			readln(n.precio);
		end;
	end;
	procedure insertar (var a:arbol; n:infoGuardar);
	begin
		if (a = nil) then begin
			new(a); a^.dato:=n; a^.hd:=nil; a^.hi:=nil;
		end
		else if (a^.dato.codigo < n.codigo) then insertar(a^.hd, n)
		else insertar(a^.hi, n);
	end;
begin
	incializarVector(v);
	writeln('leyendo');
	leer(n,r);
	while(n.codigo <> -1) do begin
		insertar(v[r], n);
		writeln('leyendo');
		leer(n,r);
	end;
end;
{b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código 
* existe o no para ese rubro.}
procedure incisoB (v:vector; var esta:boolean; r:integer; codigo:integer);
	function buscar (a:arbol; codigo:integer):boolean;
	begin
		if (a=nil) then
			buscar:=false
		else buscar:=(a^.dato.codigo = codigo) or buscar(a^.hi, codigo) or buscar(a^.hd, codigo);
	end;
begin
	if (r >= 1) and (r <= dimF) then begin
		if (v[r] = nil) then writeln('Rubro vacio')
		else esta:=buscar(v[r], codigo);
	end
	else  writeln('Rubro fuera de rango');
end;   
{c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto 
* con mayor código.}
procedure incisoC (v:vector; var vC:vectorC);
var
	i:integer;
	procedure maximo(a:arbol; var dC:datoC);
	begin
		if (a = nil) then begin
			writeln('En el rubro no hay datos');
			dC.codigo:=-1;
			dC.stock:=-1; 
		end
		else begin
			if (a^.hd = nil) then begin
				writeln('Encontrado');
				dC.codigo:=a^.dato.codigo;
				dC.stock:=a^.dato.stock;
			end
			else maximo(a^.hd, dC);
		end;
	end;
begin
	for i:=1 to dimF do begin
		maximo(v[i], vC[i]);
		writeln(vc[i].codigo);
	end;
end;
{d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de 
* productos con códigos entre los dos valores ingresados.}
procedure incisoD (v:vector; var vD:vectorD);
var
	i:integer; r1, r2:integer;
	function contar (a:arbol; r1:integer; r2:integer):integer;
	begin
		if(a = nil) then contar:=0
		else begin
			if (a^.dato.codigo < r1) then
				contar:=contar(a^.hd, r1, r2)
			else if (a^.dato.codigo >= r1) and (a^.dato.codigo <= r2) then
				contar:=1+contar(a^.hd, r1, r2)+contar(a^.hi, r1, r2)
			else contar:=contar(a^.hi, r1, r2);
		end;
	end;
begin	
	writeln('Indique numero para rango inferior');
	readln(r1);
	writeln('Indique numero para rango superior');
	readln(r2);
	for i:=1 to dimF do begin
		vD[i]:=contar(v[i], r1, r2);
		writeln('En el rango del indice ',i,':',vD[i]);
	end;
end;
var
	v:vector; r:integer; cod:integer; esta:boolean; vC:vectorC; vD:vectorD;
begin
	incisoA(v);
	writeln('rubro a buscar');
	readln(r); 
	writeln('codigo a buscar');	
	readln(cod);
	incisoB(v, esta, r, cod);
	writeln('Inciso c');
	incisoC(v, vC);
	incisoD(v, vD);
end.
