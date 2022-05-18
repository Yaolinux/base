description="Init system to control boot, execution and halt of a linux system"
url="http://www.freedesktop.org/wiki/Software/systemd/"

packager="Yaolinux Team"
maintainer="Graknu"

name=openrc
version=0.44.10

_makeargs=(BRANDING='Yaolinux')
_makeargs+=(MKPAM=pam)
_makeargs+=(MKSELINUX=no)
_makeargs+=(MKTERMCAP=ncurses)
_makeargs+=(PKG_PREFIX="")
_makeargs+=(LIBDIR=/usr/lib)
_makeargs+=(SHLIBDIR=/usr/lib)
_makeargs+=(LIBEXECDIR=/usr/libexec/rc)
_makeargs+=(BINDIR=/usr/bin)
_makeargs+=(SBINDIR=/usr/bin)
_makeargs+=(SYSCONFDIR=/etc/openrc) # avoid conflicts with other init systems

PKGMK_KEEP_SOURCES="no"
PKGMK_IGNORE_RUNTIMEDEPS="yes"

source=(https://github.com/OpenRC/openrc/archive/refs/tags/0.44.10.tar.gz)

prepare() {
  cd $name-$version

  sed -i 's:0444:6444:' mk/sys.mk

  # inittab does not honor SBINDIR
  sed -ie 's!/sbin/rc!/usr/bin/rc!g' support/sysvinit/inittab
}

build () {

  cd $name-$version

  make "${_makeargs[@]}"

}

package() {

    cd $name-$version
    make DESTDIR="$pkgdir" "${_makeargs[@]}" install

    # default path to inittab conflicts with initscripts
    #install -m 644 support/sysvinit/inittab "$pkgdir"/etc/inittab

    # avoid initscripts conflict, requires openrc-sysvinit
    install -m 644 support/sysvinit/inittab $PKG/etc/openrc/inittab

    install -m755 -d $PKG/usr/share/licenses/$name
    install -m644 LICENSE AUTHORS $PKG/usr/share/licenses/$name/
}
