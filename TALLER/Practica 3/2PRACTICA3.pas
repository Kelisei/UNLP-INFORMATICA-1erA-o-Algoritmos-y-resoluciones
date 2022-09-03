{2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y 
* cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una 
* venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo 
* del árbol debe contener el código de producto y la cantidad total vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de 
* unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de 
* unidades vendidas de ese producto
}
program xd;
type
	producto = record
		codigo:integer;
		cantidad:integer;
	end;
	venta = record
		codigo:integer;
		fecha:string;
		cantidad:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:venta;
		hi:arbol;
		hd:arbol;
	end;
	arbol2 = ^nodo2;
	nodo2 = record
		dato:producto;
		hi:arbol2;
		hd:arbol2;
	end;
procedure IyII {a} (var a:arbol; var a2:arbol2);
var
	n:venta; n2:producto;
	procedure {a} leer (var n:venta);
	begin
		writeln('Introduzca codigo de producto');
		readln(n.codigo);
		if (n.codigo <> 0) then begin
			writeln('Introduzca la fecha de la venta');
			readln(n.fecha);
			writeln('Introduzca la cantidad vendida');
			readln(n.cantidad);
		end;
	end;
	procedure crearA1 {a}(var A:arbol; n:venta);
	Begin
	  if (A = nil) then
	   begin
		  new(A);
		  A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
	   end
	   else
		if (n.codigo < A^.dato.codigo) then crearA1(A^.HI,n)
		else crearA1(A^.HD,n)   
	End;
	procedure crearA2 {a}(var A:arbol2; n:producto);
	Begin
		if(A = nil) then
		begin
		  new(A);
		  A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
	   end
	   else begin
		   if (A^.dato.codigo = n.codigo) then
		   begin
			  writeln('cantidad a agregar:', n.cantidad);
			  A^.dato.cantidad:= A^.dato.cantidad+n.cantidad;
		   end
		   else begin
			   if (n.codigo < A^.dato.codigo) then crearA2(A^.HI,n)
			   else crearA2(A^.HD,n)   
		   end;
	   end;
	End;
begin
	writeln('Introduzca los datos de la venta!');
	leer(n);
	if (n.codigo <> 0) then begin
		writeln('Creando arbol1');
		crearA1(a, n);
		n2.codigo:=n.codigo; n2.cantidad:=n.cantidad;
		writeln('Creando arbol2');
		crearA2(a2, n2);
		IyII(a, a2);
	end;
end;
procedure b (var a:arbol; var cantv1:integer);
var
	num:integer; 
	function total (a:arbol; num:integer):integer;
	begin
		if (a = nil) then
			total:=0
		else if (a^.dato.codigo = num) then
			total:= a^.dato.cantidad+total(a^.hd, num)
		else if (num < a^.dato.codigo) then 
			total:=total(a^.hi, num) 
		else total:=total(a^.hd, num);
	end;
begin
	readln(num);
	cantv1:=total(a,num);
	writeln('Diga un numero de producto!');
	writeln('Las ventas de ',num,' son de ',cantv1);
end;
//-------------
procedure c (var a:arbol2);
var
	num:integer;
//-------------
	function total (a:arbol2; num:integer):integer;
	begin
		if (a = nil) then
			total:=0
		else begin 
			if (a^.dato.codigo = num) then
				total:=a^.dato.cantidad
			else begin
				if (num < a^.dato.codigo) then 
					total:= total(a^.hi, num) 	
				else total:= total(a^.hd, num);
			end;
		end;
	end;
begin
	writeln('Diga un numero de producto!');
	readln(num);
	writeln(total(a,num));
end;
//-------------
{DEBUG}

var
	a:arbol; a2:arbol2; cant:integer;
begin
	IyII(a, a2);
	b(a,cant);
	c(a2);
end.
