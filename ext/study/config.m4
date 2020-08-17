dnl config.m4 for extension study

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

 PHP_ARG_WITH([study],
   [for study support],
   [AS_HELP_STRING([--with-study],
     [Include study support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([study],
  [whether to enable study support],
  [AS_HELP_STRING([--enable-study],
    [Enable study support])],
  [no])

if test "$PHP_STUDY" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, STUDY_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-study -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/study.h"  # you most likely want to change this
  dnl if test -r $PHP_STUDY/$SEARCH_FOR; then # path given as parameter
  dnl   STUDY_DIR=$PHP_STUDY
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for study files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       STUDY_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$STUDY_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the study distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-study -> add include path
  dnl PHP_ADD_INCLUDE($STUDY_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-study -> check for lib and symbol presence
  dnl LIBNAME=STUDY # you may want to change this
  dnl LIBSYMBOL=STUDY # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_STUDY_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your study library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $STUDY_DIR/$PHP_LIBDIR, STUDY_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_STUDY_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your study library.])
  dnl ],[
  dnl   -L$STUDY_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(STUDY_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_STUDY, 1, [ Have study support ])

  PHP_NEW_EXTENSION(study, study.c, $ext_shared)
fi

if test -z "$PHP_DEBUG"; then
    AC_ARG_ENABLE(debug,
        [--enable-debug  compile with debugging system],
        [PHP_DEBUG=$enableval], [PHP_DEBUG=no]
    )
fi
