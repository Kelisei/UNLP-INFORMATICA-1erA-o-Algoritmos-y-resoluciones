{1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
}
program uno;
const
	dimF = 300;
type
	oficina = record
		codigo:integer;
		dni:integer;
		expensa:real;
	end;
	vector = array [1..dimF] of oficina;
{a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
* DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.}
procedure a (var v:vector; var dimL:integer);
var
	n:oficina;
	procedure leer(var n:oficina);
	begin
		readln(n.codigo);
		//n.codigo:=random(300);
		if(n.codigo <> -1) then begin
			n.dni:=random(300);
			//readln(n.dni);
			//readln(n.expensa);
			n.expensa:=random(100);
			writeln('expensa',n.expensa:2:2);
		end;
	end;
begin
	dimL:=0;
	leer(n);
	while (n.codigo <> -1) and (dimL < 300) do begin
		dimL:=dimL+1;
		writeln('Diml:',dimL);
		v[dimL]:=n;
		leer(n);
	end;
end;
{b)	Ordene el vector, aplicando uno de los métodos de inserción vistos en la cursada, para obtener el vector ordenado por código de 
* identificación de la oficina.}
procedure b (var v:vector; dimL:integer);
var i, j: integer; actual: oficina;		
begin
 for i:=2 to dimL do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) and (v[j].codigo > actual.codigo) do      
       begin
         v[j+1]:= v[j];
         j:= j-1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;
{c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho 
* código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el 
* código buscado no existe.}
procedure c (v:vector; dimL: integer;var ok:boolean);
var 
   bus, pri, ult, medio: integer;
begin
  readln(bus);
  ok:=false;
  pri:=1;
  ult:=dimL;
  medio:=(pri+ult) div 2;
  while (pri <= ult) and (bus <> v[medio].codigo) do begin
        if (bus < v[medio].codigo) then
            ult:=medio-1
        else pri:=medio+1;
        medio:= (pri+ult) div 2;
    end;
    if (pri <= ult) and (bus = v[medio].codigo) then begin
		writeln('Dni:',v[medio].dni);
		ok:=True;
    end
    else writeln('No ta');
end;
{d)	Tenga un módulo recursivo que retorne el monto total de las expensas.}
function d (v:vector; dimL:integer):real;
begin
	if (dimL <> 0) then 
		d:=0
	else d:=v[dimL].expensa+d(v, dimL-1);
end;
var
	v:vector; dimL:integer; {ok:boolean;}
begin
	randomize();
	a(v, dimL);
	//b(v,dimL);
	//c(v, dimL, ok);
	writeln(d(v, dimL):2:2);
end.

