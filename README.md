# Atari VCS Hello World

This repository contains the simplest Atari VCS code that displays a
picture (it actually makes the screen roll on all the available colors
for the PAL platform). This code can be used as a starting point to
make amazing demos for the Atari VCS platform !


## Prerequisite

* This code has been written in DASM. The assembler can be downloaded
  from [DASM project's page](http://dasm-dillon.sourceforge.net/)

* An Atari VCS emulator (though binaries can be tested on the real
  hardware instead). [Stella](https://stella-emu.github.io) is an
  excellent emulator and debugger for the Atari 2600.

* Make is needed to be able to use the Makefile. Though one can launch
  the commands of the Makefile without using make.


## Launching hello-vcs

    $ make
    dasm main.asm -f3 -omain.bin -lmain.lst -smain.sym -d
    Debug trace OFF
    
    Complete.
    $ make run
    stella main.bin


## Files

* `main.asm` is the code displaying the blinking screen.

* `vcs.h` is copied from DASM repository. It contains the address
  mapping of the Atari VCS RIOT and TIA registers.

* `macro.h` is copied from DASM repository. It contains a couple of
  helper macros.

* `Makefile`

* `README.md` is this very file.
