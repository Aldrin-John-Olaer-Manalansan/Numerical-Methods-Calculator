# Makefile for CLISP module set readline

srcdir = /home/src/clisp/clisp-2.49/modules/readline
CC = gcc -mno-cygwin
CPPFLAGS = -I/usr/local/include 
CFLAGS = -g -O2
CLISP = /home/src/clisp/clisp-2.49/build-full/clisp -K boot  -E UTF-8 -Epathname 1:1 -Emisc 1:1 -norc -norc -q
CLISP_LINKKIT = /G//gnu//home//src//clisp//clisp-2.49//build-full//linkkit

LN = ln

MAKE = make

SHELL = /bin/sh

GENERATED = readline.o readline.fas
DISTRIBFILES = link.sh Makefile $(GENERATED) $(srcdir)/readline.lisp
distribdir =

# default target: make the module
clisp-module : $(GENERATED)

readline.c readline.fas : $(srcdir)/readline.lisp
	$(CLISP) -c $(srcdir)/readline.lisp -o ./

readline.o : readline.c config.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -I$(CLISP_LINKKIT) -c readline.c

# Make a module distribution into $(distribdir)
clisp-module-distrib : clisp-module force
	$(LN) $(DISTRIBFILES) $(distribdir)

clean : force
	rm -f core *.o *.a *.fas *.lib

distclean : clean

force :

