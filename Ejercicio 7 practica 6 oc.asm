ORG 1000
IEEE_LOW DW 1001011110010111B
IEEE_HIGH DW 1001011110010111B

ORG 3000H

ANALISIS: MOV CX, AX
AND CX, 0111111110000000B; Extraemos exponnente
JNZ NOT_0_EXP; De no ser 0, ya sabemos que no es desnormalizado o 0
MOV CX, AX
AND CX, 0000000001111111B
JNZ DESN; Si hay alguna parte de la mantisa que no sea 0, entonces es un desnormalizado
MOV CX, DX
AND DX, 1111111111111111B
JNZ DESN; Si hay alguna parte de la mantisa que no sea 0, entonces es un desnormalizado
MOV CL, 3H; Si paso es checks, sabemos que es 0 (+/-)
JMP FIN
DESN: MOV CL, 0H
JMP FIN
NOT_0_EXP: CMP AX, 0111111110000000B; Si hay todos 1 significa que es infinito o NAN
JNZ NORMALIZADO; Asi que si esto da diferente de 0, saltamos a normalizados
MOV CX, AX
AND CX, 0000000001111111B;  Extraemos la parte de la mantisa que esta en la parte alata
JNZ NAN; Si no es 0 es NAN
AND DX, 1111111111111111B; Es como hacer una comparacion, total no cambia nada y es ams rapido
JNZ NAN; Lo mismo que con la otra parte
MOV CL, 1H
JMP FIN
NORMALIZADO: MOV CL, 4H
JMP FIN
NAN: MOV CL, 2H
FIN: RET

ORG 2000H

MOV AX, IEEE_HIGH
MOV DX, IEEE_LOW
CALL ANALISIS
HLT
END
