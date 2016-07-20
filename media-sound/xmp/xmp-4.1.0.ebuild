# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /data/temp/gentoo//vcs-public-cvsroot/gentoo-x86/media-sound/xmp/xmp-3.5.0.ebuild,v 1.3 2012/05/05 08:55:47 mgorny Exp $

EAPI=4

DESCRIPTION="Extended Module Player"
HOMEPAGE="http://xmp.sourceforge.net/"
SRC_URI="mirror://sourceforge/xmp/${P}.tar.gz"
#SRC_URI="https://github.com/cmatsuoka/xmp-cli/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa oss pulseaudio"

RDEPEND="alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"
DEPEND="${RDEPEND}
	media-libs/libxmp
	virtual/pkgconfig
	oss? ( virtual/os-headers )"

#S="${WORKDIR}/xmp-cli-${P}"

src_configure() {
    econf \
        $(use_enable alsa) \
		$(use_enable oss) \
        $(use_enable pulseaudio) 
}

src_install() {
    default
}
