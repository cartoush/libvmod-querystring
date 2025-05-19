================
vmod-querystring
================

.. image:: https://travis-ci.org/Dridi/libvmod-querystring.svg
   :alt: Travis CI badge
   :target: https://travis-ci.org/Dridi/libvmod-querystring/
.. image:: https://codecov.io/gh/Dridi/libvmod-querystring/branch/master/graph/badge.svg
   :alt: Codecov badge
   :target: https://codecov.io/gh/Dridi/libvmod-querystring

Description
===========

The purpose of this module is to give you a fine-grained control over a URL's
query-string in Varnish Cache. It's possible to remove the query-string, clean
it, sort its parameters or filter it to only keep a subset of them.

This can greatly improve your hit ratio and efficiency with Varnish, because
by default two URLs with the same path but different query-strings are also
different. This is what the RFCs mandate but probably not what you usually
want for your web site or application.

A query-string is just a character string starting after a question mark in a
URL. But in a web context, it is usually a structured key/values store encoded
with the ``application/x-www-form-urlencoded`` media type. This module deals
with this kind of query-strings.

Installation
============

See `INSTALL.rst <INSTALL.rst>`_ in the source repository.

Hacking
=======

When working on the source code, there are additional dependencies:

- autoconf
- automake
- libtool
- rst2man (python3-docutils)
- varnish (at least 6.0.6)

You will notice the lack of a ``configure`` script, it needs to be generated
with the various autotools programs. Instead, you can use the ``bootstrap``
script that takes care of both generating and running ``configure``. It also
works for VPATH_ builds.

.. _VPATH: https://www.gnu.org/software/automake/manual/html_node/VPATH-Builds.html

Arguments to the ``bootstrap`` script are passed to the underlying execution
of the generated ``configure`` script. Once ``bootstrap`` is done, you can
later run the ``configure`` script directly if you need to reconfigure your
build tree or use more than one VPATH.

If your Varnish installation did not use the default ``/usr`` prefix, you need
this in your environment before running ``./bootstrap``::

    export ACLOCAL_PATH=${PREFIX}/share/aclocal

See also
========

To learn more about query-strings and HTTP caching, you can have a look at the
relevant RFCs:

- `RFC 1866 Section 8.2.1`__: The form-urlencoded Media Type
- `RFC 3986 Section 3`__: Syntax Components
- `RFC 7234 Section 2`__: Overview of Cache Operation

__ https://tools.ietf.org/html/rfc1866#section-8.2.1
__ https://tools.ietf.org/html/rfc3986#section-3
__ https://tools.ietf.org/html/rfc7234#section-2

The test suite also shows the differences in cache hits and misses with and
without the use of this module.

.. [1] https://github.com/Dridi/libvmod-querystring/releases/latest
