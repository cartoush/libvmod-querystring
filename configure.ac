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

AC_PREREQ([2.68])
AC_INIT([libvmod-querystring],
	[2.0.2],
	[https://github.com/dridi/libvmod-querystring/issues],
	[vmod-querystring],
	[https://github.com/dridi/libvmod-querystring])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_HEADER([config.h])
AC_COPYRIGHT([Copyright (C) 2012-2020  Dridi Boukelmoune])

AM_INIT_AUTOMAKE([1.12 -Wall -Werror foreign parallel-tests])
AM_SILENT_RULES([yes])

AC_ARG_VAR([RST2MAN], [the program to build manuals from reStructuredText])
AC_CHECK_PROGS(RST2MAN, [rst2man rst2man.py])

VARNISH_PREREQ([7.5.0])
VARNISH_VMODS([querystring])

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

AM_CONDITIONAL([LCOV_ENABLED], [test "$enable_lcov" != no])
if test "$enable_lcov" != no
then
	QS_CHECK_PROG([LCOV], [lcov])
	QS_CHECK_PROG([GENHTML], [genhtml])
	QS_FORCE_CFLAGS([-O0 -g -fprofile-arcs -ftest-coverage])
fi

AC_CHECK_HEADERS([cache/cache.h], [],
    [AC_MSG_ERROR([Missing \$VARNISHSRC development files.])],
	[[#include <cache/cache.h>]])

AC_CONFIG_FILES([
	Makefile
	debian/changelog
	debian/control
	debian/copyright
	src/Makefile
	vmod-querystring.spec
])

AC_OUTPUT

AS_ECHO("
	==== $PACKAGE_STRING ====

	varnish:      $VARNISH_VERSION
	prefix:       $prefix
	vmoddir:      $vmoddir
	vcldir:       $vcldir
	pkgvcldir:    $pkgvcldir

	compiler:     $CC
	cflags:       $CFLAGS
	ldflags:      $LDFLAGS

	--enable-silent-rules=$enable_silent_rules
	--enable-warnings=$enable_warnings
	--enable-docs=$enable_docs
	--enable-lcov=$enable_lcov
")
