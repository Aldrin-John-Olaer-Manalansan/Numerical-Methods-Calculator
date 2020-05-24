${MAKE-make} clisp-module \
  CC="${CC}" CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" \
  CLISP_LINKKIT="$absolute_linkkitdir" CLISP="${CLISP}"
NEW_FILES="cpcre.o"
NEW_LIBS="${NEW_FILES} -lpcre"
NEW_MODULES='pcre'
TO_LOAD='pcre'
TO_PRELOAD="preload.lisp"
