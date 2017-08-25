;;;-----------------------------------------------------------------------------
;;; Header

	PROCESSOR 6502
	INCLUDE "vcs.h"		; Provides RIOT & TIA memory map
	INCLUDE "macro.h"	; This file includes some helper macros


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
.vblank:
	dex
	sta WSYNC
	bne .vblank

	ldx #248		; 248 Kernel lines
.kernel:
	dex
	sta WSYNC
	bne .kernel

	ldx #26			; 26 Overscan lines
.overscan:
	dex
	sta WSYNC
	bne .overscan

	jmp main_loop


;;;-----------------------------------------------------------------------------
;;; Reset Vector

	SEG reset
	ORG $FFFC
	DC.W init
	DC.W init
