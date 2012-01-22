# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools autotools-utils

DESCRIPTION="BAMF Application Matching Framework"
SRC_URI="http://launchpad.net/${PN}/0.2/${PV}/+download/${P}.tar.gz"
HOMEPAGE="https://launchpad.net/bamf"
KEYWORDS="~amd64 ~x86"
SLOT="3"
LICENSE="LGPL-3"
IUSE="doc gtk3 introspection"

DEPEND="
	>=dev-lang/vala-0.11.7
	gtk3? (
		x11-libs/libwnck:3[introspection?]
		x11-libs/gtk+:3[introspection?]
	)
	!gtk3? (
		x11-libs/libwnck:1
		x11-libs/gtk+:2
	)"

RDEPEND="
	doc? ( dev-util/gtk-doc )
	dev-libs/atk
	dev-libs/dbus-glib
	gnome-base/libgtop
	x11-libs/gdk-pixbuf
	x11-libs/libwnck:3[introspection?]
	x11-libs/gtk+:3[introspection?]"

src_prepare() {

	sed -i -e 's/vapigen/'$(ls -1 /usr/bin/vapigen-* | tail -n1 | cut -d'/' -f4)'/' configure.in || die "Sed failed"

	eautoreconf
}

src_configure() {

	local myeconfargs=(
		$(use_with !gtk3 gtk 2)
		$(use_enable doc gtk-doc)
		$(use_enable introspection)
	)

	autotools-utils_src_configure
}

src_install() {

	autotools-utils_src_install
}
