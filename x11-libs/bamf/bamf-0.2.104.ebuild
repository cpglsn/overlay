# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#inherit autotools autotools-utils

DESCRIPTION="BAMF Application Matching Framework"
HOMEPAGE="https://launchpad.net/bamf"
SRC_URI="https://launchpad.net/bamf/0.2/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc gtk3 +introspection"

REQUIRED_USE="introspection? ( gtk3 )"

DEPEND="
	>=dev-lang/vala-0.14.1
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
	gtk3? (
		x11-libs/libwnck:3[introspection?]
		x11-libs/gtk+:3[introspection?]
	)
	!gtk3? (
		x11-libs/libwnck:1
		x11-libs/gtk+:2
	)"

src_prepare() {

	sed -i -e 's/vapigen/'$(ls -1 /usr/bin/vapigen-* | tail -n1 | cut -d'/' -f4)'/' configure.in || die "Sed failed"

	#eautoreconf
}

src_configure() {

	econf \
		--with-gtk=$(use gtk3 && echo 3 || echo 2) \
		$(use_enable doc gtk-doc) \
		$(use_enable introspection)

	#autotools-utils_src_configure
}

#src_install() {
	#autotools-utils_src_install
#}

