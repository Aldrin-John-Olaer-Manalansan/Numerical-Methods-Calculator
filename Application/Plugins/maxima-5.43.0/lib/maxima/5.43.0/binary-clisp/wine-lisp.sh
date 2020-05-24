#!/bin/sh
WINEPREFIX=/tmp/Gloeckl/maxima-5.43.0/crosscompile-windows/build/wine
export WINEPREFIX
# do not install (and pop up a window) for Mono and Gecko - not needed.
WINEDLLOVERRIDES="mscoree,mshtml="
export WINEDLLOVERRIDES
unset DISPLAY
/usr/bin/wine64 /tmp/Gloeckl/maxima-5.43.0/crosscompile-windows/build/clisp-prefix/src/clisp/base/lisp.exe "$@"
