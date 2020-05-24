# Makefile for CLISP module set pcre

srcdir = /home/src/clisp/clisp-2.49/modules/pcre
CC = gcc -mno-cygwin
PCRECPPFLAGS = -I/usr/local/include
CFLAGS = -g -O2
CLISP = /home/src/clisp/clisp-2.49/build-full/clisp -K boot  -E UTF-8 -Epathname 1:1 -Emisc 1:1 -norc -norc -q
CLISP_LINKKIT = /G//gnu//home//src//clisp//clisp-2.49//build-full//linkkit

LN = ln
LN_S = ln

MAKE = make

SHELL = /bin/sh

GENERATED = pcre.fas cpcre.o preload.lisp
DISTRIBFILES = link.sh Makefile $(GENERATED) $(srcdir)/pcre.lisp
distribdir =

# default target: make the module
clisp-module : $(GENERATED)

pcre.fas: $(srcdir)/pcre.lisp
	$(CLISP) -c $(srcdir)/pcre.lisp -o ./

cpcre.o : cpcre.m.c config.h
	$(CC) $(CPPFLAGS) $(PCRECPPFLAGS) $(CFLAGS) -I$(CLISP_LINKKIT) \
		-c cpcre.m.c -o cpcre.o

cpcre.m.c : $(srcdir)/cpcre.c
	$(CLISP) -C $(CLISP_LINKKIT)/modprep $(srcdir)/cpcre.c ./

preload.lisp : $(srcdir)/preload.lisp
	$(LN_S) $(srcdir)/preload.lisp .

# Make a module distribution into $(distribdir)
clisp-module-distrib : clisp-module force
	$(LN) $(DISTRIBFILES) $(distribdir)

clean : force
	rm -f core *.o *.a *.m.c *.fas *.lib

distclean : clean

force :

