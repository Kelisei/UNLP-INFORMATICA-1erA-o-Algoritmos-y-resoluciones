program Zapallo;
type
	vectorLetras = array [1..100] of char;
	letraApariciones = record
		letra: char;
		veces: integer;
	end;
	vectorContador = array [1..100] of letraApariciones;

//CargarVectorLetras (var V: vectorLetras; var dimL: integer); se dispone
procedure Contar (V: vectorLetras; dimL: integer);
var 
	i, j:integer; actual: char; V2:vectorContador;
begin
	i:=1; j:=1;
	while (i < dimL) do begin
		V2[j].veces:=0;
		actual:= V[i];
		while (i < dimL) and (actual = V[i]) begin 
			V2[j].veces:=V2[j].veces+1;
			i:=i+1;
		end;
		V2[j].letra:=actual;
		j:=j+1;
	end;
	for i := 1 to j do begin
		writeln (V2[i].letra, V2[i].veces);
	end;
end;
var
	V:vectorLetras; dimL:integer;
begin
	//CargarVectorLetras (V, dimL);
	Contar (V, dimL);
end;
//Calculo de tiempo
//2--> asignaciones.
//while (n+1).(condicion)+n.(cuerpo)-----> (n+1)+n(1+1+ (n+1).(3)+n.(2)+2) 
//n+1+n(2+3n+3+2n+2)
//n+1+n(7+5n)
//n+1+7n+5n^2 
//5n^2 +8n+1
//5n^2 +8n+3
//3.n+2--->for 
//5n^2 +11n+5

