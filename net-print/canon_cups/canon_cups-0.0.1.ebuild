# synkek stk11xx driver
# ebuild by Eugeny Borisov a.k.a. kstati

EAPI="2"
#inherit linux-mod
DESCRIPTION="Canon cups Drivers"
HOMEPAGE="I have no home ("

SVN_URI="https://syntekdriver.svn.sourceforge.net/svnroot/syntekdriver/trunk/driver"

#LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ARCH="x86_64"

DEPEND=""
RDEPEND="${DEPEND}"


#DRIVER_DIR="${S}"/driver
#DDIR=${D}/lib/modules/`uname -r`/kernel/drivers/usb/media

#src_install() {
#  mkdir ${S}
#  cd ${S}
#  svn checkout "${SVN_URI}" || die "can't checkout sources"
#  cp -f "${FILESDIR}"/"${STK_MAKEFILE}" "${DRIVER_DIR}/Makefile" || die "can't copy makefile"
#}

unpack() {
  elog "Unpacking $1 to DistDir"
  tar -xpzf "$1" -C "$2"
}
pkg_setup() {
#  src_install(){
  mkdir -p ${D}
  for i in `ls -1 ${FILESDIR}` ;do unpack "${FILESDIR}/${i}"  "${D}"  ;done
    die
}

#src_compile() {}

#src_install() { }

pkg_postinst() {
	elog ""
}
