# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /data/temp/gentoo//vcs-public-cvsroot/gentoo-x86/media-sound/xmp/xmp-3.5.0.ebuild,v 1.3 2012/05/05 08:55:47 mgorny Exp $

EAPI=4

DESCRIPTION="Libxmp is a library that renders module files to PCM data."
HOMEPAGE="http://xmp.sourceforge.net/"
SRC_URI="mirror://sourceforge/xmp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	default

	doman docs/libxmp.3
	rm -f docs/{COPYING,Makefile,libxmp.3}
	dodoc -r docs/*
}

