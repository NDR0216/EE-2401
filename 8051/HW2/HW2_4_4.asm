	ORG 0000H
	LJMP Main
	ORG 000BH	;2us
	LJMP T0ISR	;2us
	ORG 0030H
Main:	MOV TMOD, #01H	;T0 MODE 1
	MOV IE, #82H	;ENABLE T0 INT
	SETB TF0	;force T0 interrupt
LOOP:	SJMP $		;2us, DO NOTHING

T0ISR:	CLR TR0		;1us
	MOV TH0, #0ECH	;2us, 488us DELAY
	MOV TL0, #84H	;2us
	SETB TR0	;1us
	CPL P1.0
	RETI