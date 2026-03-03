;------------- definiciones e includes ------------------------------
.INCLUDE "m1280def.inc" ; Incluir definiciones de Registros para 1280
;.INCLUDE "m2560def.inc" ; Incluir definiciones de Registros para 2560

.equ INIT_VALUE = 0 ; Valor inicial R24

;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
;------------- implementar ------------------------------------------
;call delay103uS
;call delay1mS
;call delay1S
;call myRand ; Retorna valor en R25
;------------- ciclo principal --------------------------------------

call delay_1s  ;5
nop


;-------------------------- Delay  20 us ------------------------------
deley_20us:
	ldi r24, 103    ;1
nxt: 
	dec r24		;n
	brne nxt 	;2n - 1
nop		;1
ret		;5


;-------------------------- Delay  4 ms ------------------------------
delay_4ms:
    ldi r18, 90 ;1

outer:

    ldi r19, 236 ;n

inner:
    dec r19		 ;nm
    brne inner   ;(2m-1)n

    dec r18		 ;n
    brne outer   ;2n-1

ret			 ;5 ,5 de call


;-------------------------- Delay  1 s ------------------------------
delay_1s:
    ldi r18, 25 ;1

outer2:

    ldi r19, 90 ;n

inner2:
	ldi r20, 236  ;nm

center:
	
   	dec r20		;nmi
	brne center	;(2i-1)nm
	
    dec r19		 ;nm
    brne inner2   ;(2m-1)n
	
    dec r18		 ;n
    brne outer2   ;2n-1
	
	ldi r21, 55  ; 1
zzz:
	dec r21 ;z
	brne zzz ;2z-1


ret			 ;5 ,5 de call


;1+n+nm+nmi+(2i-1)nm+nm+(2m-1)n+n+2n-1+1+1+5+5



arriba: inc R24
	cpi R24,10
	breq abajo
	out PORTA,R24
	rjmp arriba

abajo: dec R24
	cpi R24,0
	breq arriba
	out PORTA,R24
	rjmp abajo
