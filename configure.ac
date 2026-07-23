# Copyright (C) 2012-2019  Dridi Boukelmoune
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

AC_PREREQ([2.69])
AC_INIT([libvmod-querystring],
	[2.0.2],
	[https://github.com/nigoroll/libvmod-querystring/issues],
	[vmod-querystring],
	[https://github.com/nigoroll/libvmod-querystring])
AC_COPYRIGHT([Copyright (C) 2012-2020  Dridi Boukelmoune])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_SRCDIR([src/vmod_querystring.vcc])
AC_CONFIG_HEADER([config.h])

AM_INIT_AUTOMAKE([1.12 -Wall -Werror foreign parallel-tests])
AM_PROG_AR

LT_PREREQ([2.2.6])
LT_INIT([dlopen disable-static])

QS_ARG_ENABLE([warnings], [no])
QS_ARG_ENABLE([docs], [no])
QS_ARG_ENABLE([lcov], [no])

AX_PTHREAD(, [AC_MSG_ERROR([Could not configure pthreads support])])

if test "$enable_warnings" != no
then
	# FreeBSD's WARNS level 6
	QS_CHECK_CFLAGS([
		-Werror
		-Wall
		-W
		-Wstrict-prototypes
		-Wmissing-prototypes
		-Wpointer-arith
		-Wreturn-type
		-Wcast-qual
		-Wwrite-strings
		-Wswitch
		-Wshadow
		-Wunused-parameter
		-Wcast-align
		-Wchar-subscripts
		-Winline
		-Wnested-externs
		-Wredundant-decls
		-Wold-style-definition
		-Wmissing-variable-declarations
	])

	# Other desirable warnings
	QS_CHECK_CFLAGS([
		-Wextra
		-Wmissing-declarations
		-Wredundant-decls
		-Wsign-compare
		-Wunused-result
		-Wformat-security
	])
fi

AC_ARG_VAR([RST2MAN], [the program to build manuals from reStructuredText])
AC_CHECK_PROGS(RST2MAN, [rst2man rst2man.py])

AC_ARG_WITH([lcov],
    AS_HELP_STRING(
        [--with-lcov=PATH],
        [Location of lcov to generate coverage data (auto)]),
    [LCOV="$withval"],
    [AC_CHECK_PROGS(LCOV, [lcov], [])])
AM_CONDITIONAL(HAVE_LCOV, [test -n "$LCOV"])

AC_ARG_WITH([genhtml],
    AS_HELP_STRING(
        [--with-genhtml=PATH],
        [Location of genhtml to generate coverage reports (auto)]),
    [GENHTML="$withval"],
    [AC_CHECK_PROGS(GENHTML, [genhtml], [])])
AM_CONDITIONAL(HAVE_GENHTML, [test -n "$GENHTML"])

# $QS_VINYL_VERSION is set by the bootstrap script

VINYL_PREREQ([${QS_VINYL_VERSION:-9.0.0}])
VINYL_VMODS([querystring])

QS_CHECK_SYM([WS_ReserveAll], [#include <cache/cache.h>],
	[$VINYLAPI_CFLAGS])

QS_CHECK_SYM([WS_Reservation], [#include <cache/cache.h>],
	[$VINYLAPI_CFLAGS])

AC_CONFIG_FILES([
	Makefile
	debian/changelog
	debian/control
	debian/copyright
	src/Makefile
	vmod-querystring.spec
])

AC_CHECK_PROG([HAVE_GIT], [git], [yes], [no])
if test "x$HAVE_GIT" = "xyes"; then
	if git rev-parse --git-dir >/dev/null 2>&1; then
		HAVE_GIT_REPO=yes
	else
		HAVE_GIT_REPO=no
	fi
else
	HAVE_GIT_REPO=no
fi
AM_CONDITIONAL([HAVE_VCS_VMOD_VERSION], [test -f "src/vmod_vcs_version.txt" || test "x$HAVE_GIT_REPO" = "xyes"])
if test "x$HAVE_GIT_REPO" != "xyes" && test ! -f "src/vmod_vcs_version.txt"; then
   AC_MSG_WARN([Building without version control metadata - vmod_vcs_version.txt will be unavailable])
fi

AC_OUTPUT

AS_ECHO("
	==== $PACKAGE_STRING ====

	vinyl:        $VINYL_VERSION
	prefix:       $prefix
	vmoddir:      $vmoddir

	compiler:     $CC
	cflags:       $CFLAGS
	ldflags:      $LDFLAGS

	--enable-warnings=$enable_warnings
")
