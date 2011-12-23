# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="System information and benchmark tool"
HOMEPAGE="http://hardinfo.berlios.de/"
SRC_URI="http://download.berlios.de/hardinfo/${P}.tar.bz2"

SLOT="0"
KEYWORDS="amd64 ~x86"
LICENSE="GPL-2"
IUSE=""

RDEPEND="
	x11-libs/gtk+:2
	net-libs/libsoup:2.4"

DEPEND="${RDEPEND}"
