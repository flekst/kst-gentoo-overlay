# synkek stk11xx driver
# ebuild by Eugeny Borisov a.k.a. kstati

EAPI="2"
inherit linux-mod


DESCRIPTION="Syntek Semicon DC-1125 Driver for x86_64"
HOMEPAGE="http://downloads.sourceforge.net/project/syntekdriver"

SVN_URI="https://syntekdriver.svn.sourceforge.net/svnroot/syntekdriver/trunk/driver"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ARCH="x86_64"

DEPEND="sys-kernel/gentoo-sources
		dev-util/subversion"
RDEPEND="${DEPEND}"

STK_MAKEFILE=Makefile-syntekdriver

DRIVER_DIR="${S}"/driver
DDIR=${D}/lib/modules/`uname -r`/kernel/drivers/usb/media

src_prepare() {
  mkdir ${S}
  cd ${S}
  svn checkout "${SVN_URI}" || die "can't checkout sources"
  cp -f "${FILESDIR}"/"${STK_MAKEFILE}" "${DRIVER_DIR}/Makefile" || die "can't copy makefile"
}

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	cd "${DRIVER_DIR}/"
	emake || die "make falture"
}

src_install() {
	cd "${DRIVER_DIR}/"
	mkdir -p ${DDIR}
	install -m 644 stk11xx.ko ${DDIR}
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog
	elog "Please add \"stk11xx\" to:"
	elog
		if has_version sys-apps/openrc; then
		elog "/etc/conf.d/modules"
	else
		elog "/etc/modules.autoload.d/kernel-${KV_MAJOR}.${KV_MINOR}"
	fi
	elog ""
}
