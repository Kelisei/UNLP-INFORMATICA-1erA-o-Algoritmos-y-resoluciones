{ Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra se conoce código del 
cliente, día, cantidad de productos y monto pagado.
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente 
se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. 

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}
program parcial;
type
	info = record
		dia:integer;
		cant:integer;
		monto:real;
	end;
	lista = ^nodoLista;
	nodoLista = record
		datoL:info;
		sig:lista;
	end;
	
	infoGuardar = record
		l:lista;
		codigo:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:infoGuardar;
		hd:arbol;
		hi:arbol;
	end;
	
	infoLeer = record
		dia:integer;
		cant:integer;
		monto:real;
		codigo:integer;
	end;
procedure incisoA (var a:arbol);
	procedure agregarAdelante( var l: lista; r: info);
    var  nue:lista;
    begin
         new(nue);
         nue^.datoL:= r;
         nue^.sig:= l;
         l:= nue;
    end;
	procedure insertar {a}(var A:arbol; codigo:integer; n:info);
	 Begin
		if (A = nil) then
		begin
		  new(A);
		  A^.dato.codigo:=codigo; 
		  a^.dato.l:=nil;
		  agregarAdelante(a^.dato.l, n);
		  A^.HI:= nil; A^.HD:= nil;
		end
        else begin
            if (A^.dato.codigo = codigo) then // inserta un nodo en una lista existente
                agregarAdelante(a^.dato.l, n)
			else if (codigo < A^.dato.codigo) then insertar(A^.HI,codigo, n)
			else insertar(A^.HD,codigo, n);
		end;
	end;
	procedure armarDato (n:infoLeer; var v:info);
	begin
		v.dia:=n.dia;
		v.cant:=n.cant;
		v.monto:=n.monto;
	end;
	procedure leer (var cod:integer; var n:info);
	begin
		//writeln('introduzca la cantidad');
		//readln(n.cant);
		n.cant:=random(100);
		//writeln(n.cant);
		if (n.cant <> 0) then begin
			//writeln('introduzca el codigo');
			//readln(cod);
			cod:=random(10)+1;
			//writeln(cod);
			//writeln('introduzca el dia');
			//readln(n.dia);
			n.dia:=random(31)+1;
			//writeln(n.dia);
			//writeln('introduzca el monto');
			//readln(n.monto);
			n.monto:=150.87+random(8000);
	//		writeln(n.monto:2:2);
		end;
	end;
var
	cod:integer;
	 v:info;
begin
	cod:=0;
	writeln('leer');
	leer(cod, v);
	while(v.cant <> 0) do begin
		insertar(a, cod, v);
		leer(cod, v);
	end;
end;
procedure mostrarLista (l:lista);
begin
  	while (l <> nil) do begin
			writeln('Dia: ',l^.datoL.dia, ' .cant: ', l^.datoL.cant, ' monto: ',l^.datoL.monto:2:2);
		l:=l^.sig;
	end;
end;
procedure mostrarArbol (a:arbol);
begin
  if (a <> nil) then begin
  mostrarArbol(a^.hi);
    writeln('Codigo: ',a^.dato.codigo);
    mostrarLista(a^.dato.l);
  mostrarArbol(a^.hd);
  end;
end;


procedure incisoB (var l:lista; a :arbol);
var
	codigo:Integer;
	function buscarPedidos (a: arbol; codigo: integer):lista;
	begin
	  if (a = nil)
	  then buscarPedidos:= nil
	  else if( a^.dato.codigo = codigo)
		   then buscarPedidos:= a^.dato.l
		   else if(codigo < a^.dato.codigo )
				then buscarPedidos:= buscarPedidos (a^.hi, codigo)
				else buscarPedidos:= buscarPedidos (a^.hd, codigo);
	end;
	function EncontrarCliente (codigo:integer; a:arbol):lista;
	begin
		if (a = nil) 
		then EncontrarCliente:=nil
		else begin
			if (codigo = A^.dato.codigo) then EncontrarCliente:=A^.dato.l
			else if (codigo < A^.dato.codigo) then EncontrarCliente:=EncontrarCliente(codigo, A^.HI)
			else EncontrarCliente:=EncontrarCliente(codigo, A^.HD);
		end;
	end;
begin
	l:=nil;
	writeln('introduzca un codigo cliente para retornar sus compras');
	readln(codigo);
	//l:=buscarPedidos(a, codigo);
	l:=EncontrarCliente(codigo, a);
end;
{c ) Realizar un  módulo recursivo que reciba la estructura que retorna el inciso b ) y retorne el monto de la compra con mayor cantidad de productos .}
procedure incisoC(l:lista; var montoMax:Real);
    procedure encontrarMaxProd (l:lista; var cantMax:integer; var montoMax:real);
    begin
        if(l <> nil) then begin
            if (l^.datoL.cant > cantMax) then begin
                cantMax:=l^.datoL.cant;
                montoMax:=l^.datoL.monto;
            end;
            encontrarMaxProd(l^.sig, cantMax, montoMax);
        end;
    end;
var
    cantMax:integer;
begin
    cantMax:=-1;
    encontrarMaxProd(l , cantMax, montoMax);
    writeln(cantMax);
end;
var
	a:arbol; l:lista;
	montoMax:real;
begin
    montoMax:=0;
	Randomize;
	incisoA(a);
	writeln('Imprimir lista');
    mostrarArbol(a);
	incisoB(l, a);
	incisoC(l,montoMax);
	if(montoMax<>0) then
	    writeln('el monto max es: ',montoMax:2:2);
	//else ('No se encontraron ventas,pues lista vacia');
end.
