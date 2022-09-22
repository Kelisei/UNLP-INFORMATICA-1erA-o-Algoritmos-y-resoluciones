{1-
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. 
* De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado 
* por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído 
* y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído 
* y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne dicho promedio.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores 
* ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. }
program xd;
type
	socio = record
		numero:integer;
		nombre:string;
		edad:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:socio;
		hi:arbol;
		hd:arbol;
	end;
procedure {a} leer (var n:socio);
begin
	writeln('Introduzca numero de socio');
	readln(n.numero);
	if (n.numero <> 0) then begin
		writeln('Introduzca el nombre del socio');
		readln(n.nombre);
		writeln('Introduzca la edad del socio');
		readln(n.edad);
	end;
end;
procedure crear {a}(var A:arbol; n:socio);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (n.numero < A^.dato.numero) then crear(A^.HI,n)
    else crear(A^.HD,n)   
End;

procedure cA {a} (var a:arbol);
var
	n:socio;
begin
	writeln('Introduzca los datos del socio!');
	leer(n);
	if (n.numero <> 0) then begin
		crear(a, n);
		cA(a);
	end;
end;
procedure bi (a:arbol);
var
	num:integer;
//---------------------------------------------------
	function conseguirMaximo(a:arbol):integer;
	begin
		if (a = nil) then 
			conseguirMaximo:=-1
		else if (a^.hd = nil) then 
			conseguirMaximo:=a^.dato.numero
		else conseguirMaximo:=conseguirMaximo(a^.hd);
	end;
//---------------------------------------------------	
begin
	num:=conseguirMaximo(a);
	if (num = -1) then
		writeln('No hay socios cargados')
	else
		writeln('El numero de socio mas grande es ', num);
end;
procedure bii (a:arbol);
var
	num:integer;
//---------------------------------------------------
	function conseguirMinimo(a:arbol):integer;
	begin
		if (a = nil) then 
			conseguirMinimo:=-1
		else if (a^.hi = nil) then 
			conseguirMinimo:=a^.dato.numero
		else conseguirMinimo:=conseguirMinimo(a^.hi);
	end;
//---------------------------------------------------	
begin
	num:=conseguirMinimo(a);
	if (num = -1) then
		writeln('No hay socios cargados')
	else
		writeln('El numero de socio mas chico es ', num);
end;
procedure biii (a:arbol);
var
	maxEdad, maxNum:integer;
	procedure buscarMasEdad(a:arbol; var maxE:integer; var maxN:integer);
	begin
	   if ( a <> nil ) then begin
		writeln(a^.dato.numero);
		if (a^.dato.edad > maxE) then begin
			maxE:=a^.dato.edad;
			maxN:=a^.dato.numero;
		end;
		buscarMasEdad (a^.hi, maxE, maxN);
		buscarMasEdad (a^.hd, maxE, maxN);
   end;
end;

begin
	maxEdad:=-1;
	buscarMasEdad(a, maxEdad, maxNum);
	writeln('Edad mas grande ',maxEdad);
	writeln('Edad mas grande (numero de club) ',maxNum);
end;
procedure biv (a:arbol);
begin
	if (a<> nil) then begin
		a^.dato.edad:=a^.dato.edad+1;
		biv (a^.hi);
		biv (a^.hd);
	end;
end;
procedure bv (a:arbol);
var
	valor:Integer;
	function encontrar (a:arbol; v:integer):boolean;
	begin
		if (a = nil) then
			encontrar:=false
		else if (a^.dato.numero = v) then encontrar:=true
		else if (a^.dato.numero < v) then encontrar:=encontrar(a^.hd, v)
		else encontrar:=encontrar(a^.hi, v);
	end;
begin
	readln (valor);
	if (encontrar(a,valor)) then 
		writeln('encontrao numero')
	else writeln ('no ta numero');
end;
procedure bvi (a:arbol);
var
	valor:string;
	function encontrar (a:arbol; nom:string):boolean;
	begin
		if (a = nil) then
			encontrar:=false
		else encontrar:=(a^.dato.nombre = nom) or encontrar(a^.hi, nom) or encontrar(a^.hd, nom);
	end;
begin
	readln (valor);
	if (encontrar(a,valor)) then 
		writeln('encontrao nombre')
	else writeln ('no ta nombre');
end;
procedure bvii {y bvii} (a:arbol);
	function contar (a:arbol):integer;
	begin
		if (a = nil) then
			contar:=0
		else begin
			contar:= 1 + contar(a^.hd)+ contar(a^.hi);
		end;
	end;
	function total (a:arbol):integer;
	begin
		if (a = nil) then
			total:=0
		else begin
			total:= a^.dato.edad + total(a^.hd)+ total(a^.hi);
		end;
	end;
begin
	if (a = nil) then writeln ('Sin Elementos')
	else writeln ('Hay ', contar(a), ' miembro/s ');
	writeln ('Promedio de edad de ', (total(a))/contar(a)-1:2:2);
end;
procedure ix (a:arbol);
var
	r1,r2:integer;
	function contarRango (a:arbol; r1:integer; r2:integer):integer;
	begin
		writeln('iterando');
		if (a = nil) then begin
			contarRango:=0;
			writeln('Llego al final');
		end
        else begin
        	if (a^.dato.numero > r2) then 
				contarRango:=contarRango(a^.hi, r1, r2)
            else if (a^.dato.numero >= r1) and (a^.dato.numero <=  r2) then 
				contarRango:= 1 + contarRango(a^.hi, r1, r2)+contarRango(a^.hd, r1, r2)
			else contarRango(a^.hd, r1, r2)
        end;
        writeln(contarRango);
    end;
begin
	readln(r1);
	readln(r2);
	if (a = nil) then writeln ('Sin Elementos')
	else writeln ('Hay ', contarRango(a, r1, r2), ' miembro/s ');
end;
Procedure x ( a : arbol );
begin
   if ( a<> nil ) then begin
    x (a^.hi);
	writeln ('Numero de socio:',a^.dato.numero);
    x (a^.hd);
   end;
end;
Procedure xi ( a : arbol );
begin
   if ( a<> nil ) then begin
    xi (a^.hd);
    if(a^.dato.numero mod 2 = 0) then writeln ('Numero de socio par:', a^.dato.numero);
    xi (a^.hi);
   end;
end;
var
	a:arbol;
begin
	cA(a);
	//bi(a);
	//bii(a);
	//biii(a);
	//biv(a);
	//bv(a);
	//bvi(a);
	//bvii(a);
	ix(a);
	x(a);
	xi(a);
end.
