# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils

DESCRIPTION="A visual application launcher for gnome"
HOMEPAGE="http://gnome-pie.simonschneegans.de https://github.com/Simmesimme/Gnome-Pie"
SRC_URI="mirror://github/Simmesimme/${PN}/${P}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="amd64 ~x86"
SLOT="0"
IUSE="indicator"

DEPEND="
	>=dev-lang/vala-0.11
   x11-libs/bamf:2"

RDEPEND="
	x11-libs/gtk+:2
	dev-libs/libgee
	dev-libs/libxml2
	x11-libs/libXtst
	dev-libs/libunique
	x11-libs/bamf:2
	x11-libs/libwnck
	indicator? ( dev-libs/libappindicator )
	gnome-base/gnome-menus
	x11-themes/hicolor-icon-theme
	x11-libs/pango"

src_prepare() {

	sed -i -e 's/NAMES\ valac)/NAMES\ '$(ls -1 /usr/bin/valac-* | tail -n1 | cut -d'/' -f4)')/' cmake/vala/FindVala.cmake || die "Sed failed"
	sed -i -e 's/libbamf/libbamf3/' CMakeLists.txt || die "Sed failed"
}
