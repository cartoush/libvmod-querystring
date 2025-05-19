Installation
============

The module relies on the GNU Build System, also known as autotools. To install
it, start by grabbing the latest release [1]_ and follow these steps::

    # Get to the source tree
    tar -xzf vmod-querystring-${VERSION}.tar.gz
    cd vmod-querystring-${VERSION}

    # Build and install
    ./configure
    make
    make check # optional
    sudo make install

You only need to have Varnish (at least 6.0.6) and its development files
installed on your system. Instead of manually installing the module you can
build packages, see below. The ``configure`` script also needs ``pkg-config``
installed to find Varnish development files.

If your Varnish installation did not use the default ``/usr`` prefix, you
will likely need to at least set the ``pkg-config`` path to find your Varnish
installation. For example add this in your environment before running
``./configure``::

    export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

Or the approach recommended by autoconf::

    ./configure PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig ...

The module is then configured for an installation inside ``${PREFIX}``, unless
the ``--prefix`` option was used in the ``configure`` execution. For more
information about what can be configured, run ``./configure --help``.

Alongside the release archive, you will find a PDF export of the module's
manual.

RPM Packaging
=============

Instead of directly installing the package you can build an RPM::

    make rpm

The resulting packages can be found in the ``rpmbuild`` directory in your
build tree.

If you need to build an RPM for a different platform you may use ``mock(1)``
with the proper ``--root`` option. All you got to do is run ``make mockbuild``
and set the desired flags in the ``MOCK_OPTS`` variable. For instance, to
build RPMs for CentOS 7::

    make mockbuild MOCK_OPTS='--root epel-7-x86_64'

The resulting packages can be found in the ``mockbuild`` directory in your
build tree.

DPKG Packaging
==============

DPKG packaging is also available with ``dpkg-buildpackage(1)``, using the
``deb`` target::

    make deb

It is possible to either redefine the ``DPKG_BUILDPACKAGE`` command or simply
add options via ``DPKG_BUILDPACKAGE_OPTS``. For example to specify a specific
privilege escalation method::

    make deb DPKG_BUILDPACKAGE_OPTS=-rfakeroot

The resulting packages can be found in the ``dpkgbuild`` directory in your
build tree. By default sources and changes are NOT signed, in order to sign
packages the ``DPKG_BUILDPACKAGE`` variable MUST be redefined.

If you need to build a Deb for a specific platform you may use ``pdebuild(1)``
and ``pbuilder(8)`` to set up the base tarball and then run ``make pdebuild``
and set the desired flags in the ``PDEBUILD_OPTS`` variable. For instance to
build debs for Debian Sid, assuming your environment is properly configured
to switch between distributions::

    make pdebuild PDEBUILD_OPTS='-- --distribution sid'

The resulting packages can be found in the ``pdebuild`` directory in your
build tree.

As an alternative to ``pdebuild(1)`` you may prefer ``sbuild(1)`` instead.
Similarly, you may run ``make sbuild`` and set the desired flags in the
``SBUILD_OPTS`` variable. For instance to build debs for Debian Sid, assuming
your environment is properly configured to switch between distributions::

    make sbuild SBUILD_OPTS='--dist sid'

The resulting packages can be found in the ``sbuild`` directory in your
build tree.

