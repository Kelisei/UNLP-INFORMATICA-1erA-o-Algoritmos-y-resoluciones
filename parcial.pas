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
procedure incisoA (var a:arbol);
	procedure insertarLista (var l:lista; n:info);
	 var
		nue, ant, act:lista;
	 begin
		new(nue); nue^.datoL:=n; nue^.sig:=nil; 
		ant:=l; act:=l;
	
		while (act <> nil) and (act^.datoL.dia < nue^.datoL.dia) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = ant) then l:=nue
		else ant^.sig:=nue;
		nue^.sig:=act;
		end;

	procedure insertar {a}(var A:arbol; codigo:integer; n:info);
	 Begin
		if (A = nil) then
		begin
		  new(A);
		  A^.dato.codigo:=codigo; 
		  a^.dato.l:=nil;
		  insertarLista(a^.dato.l, n);
		  A^.HI:= nil; A^.HD:= nil;
		end
        else begin
            if (A^.dato.codigo = codigo) then // inserta un nodo en una lista existente
                insertarLista(a^.dato.l, n)
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
	procedure EncontrarCliente (codigo:integer; a:arbol; var l:lista);
	begin
		if (a = nil) then
			l:=nil
		else begin
			if(codigo = A^.dato.codigo) then
				l:=A^.dato.l
			else if (codigo < A^.dato.codigo) then EncontrarCliente(codigo, A^.HI, l)
			else EncontrarCliente(codigo, A^.HD, l);
		end;
	end;
begin
	l:=nil;
	writeln('introduzca un codigo cliente para retornar sus compras');
	readln(codigo);
	EncontrarCliente(codigo, a, l);
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