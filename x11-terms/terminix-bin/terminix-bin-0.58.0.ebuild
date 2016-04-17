# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A tiling terminal emulator for Linux using GTK+ 3"
HOMEPAGE="https://github.com/gnunn1/terminix"
SRC_URI="https://github.com/gnunn1/terminix/releases/download/$PV/terminix.zip -> terminix-bin-$PV.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

S=${WORKDIR}

src_prepare() {
	mv usr/share/appdata usr/share/terminix.appdata.xml
	mkdir usr/share/appdata/
	mv usr/share/terminix.appdata.xml usr/share/appdata/
}

src_install() {
	insinto /usr
	doins -r usr/share || die

	into /usr
	dobin usr/bin/terminix || die
}

pkg_postinst()
{
    glib-compile-schemas /usr/share/glib-2.0/schemas/
}
