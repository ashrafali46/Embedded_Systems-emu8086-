.MODEL SMALL
.STACK
.DATA
STR1 DB "Embedded$"
SPLIT DB 3H
STR2 DB ?
.CODE
.STARTUP
MOV SI, OFFSET STR1

CHECK1:
CMP [SI],'$'
JZ EXIT1
CMP SPLIT,0H
JZ CHECK2
DEC SPLIT
INC SI
JMP CHECK1

CHECK2:
MOV DX,DS
MOV ES,DX
MOV DI, OFFSET STR2

LOOP1:
MOVSB
CMP [SI],'$'
JZ EXIT1
LOOP LOOP1
MOV [SI],'$'

EXIT1:
.EXIT
END
