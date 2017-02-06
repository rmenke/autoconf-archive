# ======================================================================================
#  https://www.gnu.org/software/autoconf-archive/ax_check_awk_variable_value_pairs.html
# ======================================================================================
#
# SYNOPSIS
#
#   AX_CHECK_AWK_VARIABLE_VALUE_PAIRS([ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Check if AWK supports variable=value pairs ($AWK '<PROGRAM>' var=val).
#   If successful execute ACTION-IF-SUCCESS otherwise ACTION-IF-FAILURE.
#
#   This work is heavily based upon testawk.sh script by Heiner Steven. You
#   should find his script (and related works) at
#   <http://www.shelldorado.com/articles/awkcompat.html>. Thanks to
#   Alessandro Massignan for his suggestions and extensive nawk tests on
#   FreeBSD.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 9

AC_DEFUN([AX_CHECK_AWK_VARIABLE_VALUE_PAIRS],[
  AC_REQUIRE([AX_NEED_AWK])

  AC_MSG_CHECKING([if $AWK supports variable=value pairs])

  ax_try_awk_output=`echo "" | $AWK '{ print variable; }' variable=A 2> /dev/null`
  AS_IF([test $? -eq 0],[
    AS_IF([test "X$ax_try_awk_output" = "XA"],[
      AC_MSG_RESULT([yes])
      $1
    ],[
      AC_MSG_RESULT([no])
      $2
    ])
  ],[
    AC_MSG_RESULT([no])
    $2
  ])
])
