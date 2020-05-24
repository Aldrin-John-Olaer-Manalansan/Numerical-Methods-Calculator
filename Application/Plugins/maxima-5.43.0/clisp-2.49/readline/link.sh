${MAKE-make} clisp-module \
  CC="${CC}" CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" \
  CLISP_LINKKIT="$absolute_linkkitdir" CLISP="${CLISP}"
NEW_FILES="readline.o"
NEW_LIBS="${NEW_FILES} -lreadline -ltermcap "
NEW_MODULES="readline"
TO_LOAD='readline'
