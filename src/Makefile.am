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

AM_CFLAGS = $(VINYLAPI_CFLAGS)

# Modules

vmod_LTLIBRARIES = libvmod_querystring.la

libvmod_querystring_la_LDFLAGS = \
	$(VMOD_LDFLAGS)

libvmod_querystring_la_SOURCES = \
	vmod_querystring.c

nodist_libvmod_querystring_la_SOURCES = \
	vcc_querystring_if.c \
	vcc_querystring_if.h

DISTCLEANFILES = vmod_vcs_version.txt vmod_querystring.pdf

vmod_vcs_version.txt: $(no_dist_libvmod_querystring_la_SOURCES)

@BUILD_VMOD_QUERYSTRING@

# Documentation

pdf-local: vmod_querystring.pdf

.rst.pdf:
	rst2pdf $< $@

# Test suite

AM_TESTS_ENVIRONMENT = \
	PATH="$(VMOD_TEST_PATH):$(PATH)" \
	LD_LIBRARY_PATH="$(VINYL_LIBRARY_PATH):$(LD_LIBRARY_PATH)"
TEST_EXTENSIONS = .vtc
VTC_LOG_COMPILER = vinyltest -v
AM_VTC_LOG_FLAGS = -p vmod_path="$(abs_builddir)/.libs:$(VINYLAPI_VMODDIR)"

TESTS = \
	tests/e00001.vtc \
	tests/f00001.vtc \
	tests/f00002.vtc \
	tests/f00003.vtc \
	tests/f00004.vtc \
	tests/f00005.vtc \
	tests/f00006.vtc \
	tests/f00007.vtc \
	tests/f00008.vtc \
	tests/g00001.vtc \
	tests/m00001.vtc \
	tests/p00001.vtc \
	tests/p00002.vtc \
	tests/p00003.vtc \
	tests/r00022.vtc \
	tests/r00026.vtc \
	tests/w00001.vtc

# Documentation

dist_doc_DATA = \
	vmod_querystring.vcc \
	$(TESTS)

if HAVE_VCS_VMOD_VERSION
dist_doc_DATA += vmod_vcs_version.txt
endif

dist_man_MANS = \
	vmod_querystring.3


.rst.1:
	$(AM_V_GEN) $(RST2MAN) $< $@

