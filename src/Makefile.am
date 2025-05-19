# Copyright (C) 2012-2018  Dridi Boukelmoune
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

AM_CFLAGS = $(VARNISHAPI_CFLAGS)

if LCOV_ENABLED
AM_CPPFLAGS = -DWITHOUT_ASSERTS
endif

# Modules

vmod_LTLIBRARIES = libvmod_querystring.la

libvmod_querystring_la_LDFLAGS = $(VMOD_LDFLAGS)

libvmod_querystring_la_SOURCES = \
	vmod_querystring.c

nodist_libvmod_querystring_la_SOURCES = \
	vcc_querystring_if.c \
	vcc_querystring_if.h

@BUILD_VMOD_QUERYSTRING@

# Test suite

AM_TESTS_ENVIRONMENT = \
	PATH="$(abs_builddir):$(VMOD_TEST_PATH):$(PATH)" \
	LD_LIBRARY_PATH="$(VARNISH_LIBRARY_PATH)"
TEST_EXTENSIONS = .vtc
VTC_LOG_COMPILER = varnishtest -v
AM_VTC_LOG_FLAGS = \
	-p vcl_path="$(abs_top_srcdir)/vcl:$(VARNISHAPI_VCLDIR)" \
	-p vmod_path="$(abs_builddir)/.libs:$(vmoddir):$(VARNISHAPI_VMODDIR)"

TESTS = \
	vtc/e00001.vtc \
	vtc/f00001.vtc \
	vtc/f00002.vtc \
	vtc/f00003.vtc \
	vtc/f00004.vtc \
	vtc/f00005.vtc \
	vtc/f00006.vtc \
	vtc/f00007.vtc \
	vtc/f00008.vtc \
	vtc/g00001.vtc \
	vtc/m00001.vtc \
	vtc/p00001.vtc \
	vtc/p00002.vtc \
	vtc/p00003.vtc \
	vtc/r00022.vtc \
	vtc/r00026.vtc \
	vtc/w00001.vtc

# Documentation

dist_doc_DATA = \
	vmod_querystring.vcc \
	$(TESTS)

dist_man_MANS = vmod_querystring.3

CLEANFILES = vmod_querystring.pdf

pdf-local: vmod_querystring.pdf


.rst.pdf:
	rst2pdf $< $@


.rst.1:
	$(AM_V_GEN) $(RST2MAN) $< $@
