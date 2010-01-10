# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome/gnome-2.24.1.ebuild,v 1.10 2009/04/28 16:21:02 volkmar Exp $
EAPI="1"

DESCRIPTION="Meta package for the Eugeny's main system files pack"
HOMEPAGE="http://www.gnome.org/"

LICENSE="as-is"
SLOT="2.0"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"

IUSE="X"

S=${WORKDIR}

RDEPEND="
	app-editors/vim
	app-misc/mc
	app-portage/autounmask
	app-portage/eix
	app-portage/gentoolkit
	app-portage/ufed
	dev-python/pysqlite
	dev-util/ccache
	net-wireless/iwl4965-ucode
	net-wireless/wpa_supplicant
	sys-apps/lshw
	sys-apps/openrc
	sys-apps/sysvinit
	sys-apps/usbutils
	sys-auth/pambase
	
	sys-boot/grub
	sys-libs/gpm
        X? (	
		x11-base/xorg-x11
		sys-power/acpid
	)

	app-portage/getdelta
	
	virtual/eka-versioncontrol
	app-portage/layman

	sys-fs/ntfs3g
"


pkg_postinst() {
	elog
}
