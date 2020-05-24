# Makefile for CLISP module set zlib

srcdir = /home/src/clisp/clisp-2.49/modules/zlib
CC = gcc -mno-cygwin
CPPFLAGS = -I/usr/local/include
CFLAGS = -g -O2
CLISP = /home/src/clisp/clisp-2.49/build-full/clisp -K boot  -E UTF-8 -Epathname 1:1 -Emisc 1:1 -norc -norc -q
CLISP_LINKKIT = /G//gnu//home//src//clisp//clisp-2.49//build-full//linkkit

LN = ln

MAKE = make

SHELL = /bin/sh

GENERATED = zlib.o zlib.fas
DISTRIBFILES = link.sh Makefile $(GENERATED) $(srcdir)/zlib.lisp
distribdir =

# default target: make the module
clisp-module : $(GENERATED)

zlib.c zlib.fas : $(srcdir)/zlib.lisp
	$(CLISP) -c $(srcdir)/zlib.lisp -o ./

zlib.o : zlib.c config.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -I$(CLISP_LINKKIT) -c zlib.c

# Make a module distribution into $(distribdir)
clisp-module-distrib : clisp-module force
	$(LN) $(DISTRIBFILES) $(distribdir)

clean : force
	rm -f core *.o *.a *.fas *.lib

distclean : clean

force :

