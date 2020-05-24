# Makefile for CLISP module set libsvm

srcdir = /home/src/clisp/clisp-2.49/modules/libsvm
CC = gcc -mno-cygwin
SVMCPPFLAGS = -I/usr/local/include
CFLAGS = -g -O2
CLISP = /home/src/clisp/clisp-2.49/build-full/clisp -K boot  -E UTF-8 -Epathname 1:1 -Emisc 1:1 -norc -norc -q
CLISP_LINKKIT = /G//gnu//home//src//clisp//clisp-2.49//build-full//linkkit

LN = ln
LN_S = ln

MAKE = make

SHELL = /bin/sh

GENERATED = libsvm.fas libsvm.o preload.lisp
DISTRIBFILES = link.sh Makefile $(GENERATED) $(srcdir)/libsvm.lisp
distribdir =

# default target: make the module
clisp-module : $(GENERATED)

libsvm.c libsvm.fas : $(srcdir)/libsvm.lisp
	$(CLISP) -c $(srcdir)/libsvm.lisp -o ./

libsvm.o : libsvm.c config.h
	$(CC) $(CPPFLAGS) $(SVMCPPFLAGS) $(CFLAGS) -I$(CLISP_LINKKIT) -c libsvm.c

preload.lisp : $(srcdir)/preload.lisp
	$(LN_S) $(srcdir)/preload.lisp .

# Make a module distribution into $(distribdir)
clisp-module-distrib : clisp-module force
	$(LN) $(DISTRIBFILES) $(distribdir)

clean : force
	rm -f core *.o *.a *.fas *.lib

distclean : clean

force :

