ORG 1000H

TAB1 DW ?, ?, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?
TAB2 DW ?, ?, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?
TAB3 DW ?

ORG 3000H
SUMATORIA: PUSH BX; guardamos en la pila el contador
PUSH AX;            guardamos en la pila el la direccion de la tabla 1
MOV BX, AX;      guardamos la direccion de la tabla en BX
MOV AX, [BX];   movemos los datos de la direccion de la tabla 1 a AX
MOV BX, CX;       guardamos la direccion de la tabla 3 en bx
MOV [BX], AX;  guardamos en la tabla 3 el valor de la tabla 1
POP AX;               le devolvemos a ax la direccion de la tabla 1
PUSH DX;            movemos la direccion de la tabla 2 a la pila
MOV BX, DX;     movemos a BX la direccion de la tabla 2
MOV DX, [BX] ; movemos a DX el valor de la tabla 2
MOV BX, CX;     movemos a BX la direccion de la tabla 3
ADD [BX], DX;   le sumamos a la tabla 3 que ya tiene el valor de la tabla 3 lo que hay en la tabla 2
POP DX
POP BX
ADD AX, 2
ADD DX, 2
ADD CX, 2
DEC BX
PUSH BX
PUSH AX
MOV BX, AX
MOV AX, [BX]
MOV BX, CX
MOV [BX], AX
POP AX
PUSH DX
MOV BX, DX
MOV DX, [BX]
MOV BX, CX
ADC [BX], DX
POP DX
POP BX
ADD AX, 2
ADD DX, 2
ADD CX, 2
DEC BX
RET

ORG 2000H
MOV AX, OFFSET TAB1
MOV DX, OFFSET TAB2
MOV CX, OFFSET TAB3
MOV BX, 12
LAZO:CALL SUMATORIA
JNZ LAZO
HLT
END
