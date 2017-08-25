;;;-----------------------------------------------------------------------------
;;; Header

	PROCESSOR 6502
	INCLUDE "vcs.h"		; Provides RIOT & TIA memory map
	INCLUDE "macro.h"		; This file includes some helper macros


;;;-----------------------------------------------------------------------------
;;; Code segment

	SEG code
	ORG $F000
init	CLEAN_START		; Initializes Registers & Memory


main_loop:
	VERTICAL_SYNC		; 4 scanlines Vertical Sync signal
	iny
	sty COLUBK

	ldx #34			; 34 VBlank lines
	jsr skiplines

	ldx #248			; 248 Kernel lines
	jsr skiplines

	ldx #26			; 26 Overscan lines
	jsr skiplines

	jmp main_loop


; X register must contain the number of scanlines to skip
; X register will have value 0 on exit
skiplines:
	dex
	sta WSYNC
	bne skiplines
	rts

;;;-----------------------------------------------------------------------------
;;; Reset Vector

	SEG reset
	ORG $FFFC
	DC.W init
	DC.W init
