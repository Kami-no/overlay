# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils user systemd

MY_PN="${PN//-bin}"

DESCRIPTION="Madsonic is a complete, personal media streaming solution"
HOMEPAGE="http://www.madsonic.org/"
#SRC_URI="http://subsonic.org/download/${MY_PN}-${PV}-standalone.tar.gz"
SRC_URI="http://madsonic.org/download/6.2/20161222_madsonic-${PV}-standalone.tar.gz -> madsonic-${PV}-standalone.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ffmpeg lame systemd xmp"

DEPEND=""
RDEPEND="virtual/jre
	lame? ( media-sound/lame )
	ffmpeg? ( virtual/ffmpeg )
	systemd? ( sys-apps/systemd )
	xmp? ( media-sound/xmp )"

S="${WORKDIR}/"
MADSONIC_HOME="/var/lib/${MY_PN}"
USER_GROUP="madsonic"

pkg_setup() {
	enewgroup "${USER_GROUP}"
	enewuser "${USER_GROUP}" -1 -1 ${MADSONIC_HOME} "${USER_GROUP}"
}

src_install() {
	local dir="/usr/libexec/${MY_PN}"

	dodoc "Getting Started.html" || die

	insinto ${dir}
	doins madsonic-booter.jar madsonic.war || die

	exeinto ${dir}
	doexe madsonic.sh || die

	insinto ${MADSONIC_HOME}
	doins -r genre || die

	keepdir ${MADSONIC_HOME}
	fowners ${USER_GROUP}:${USER_GROUP} ${MADSONIC_HOME} || die

	newinitd "${FILESDIR}/madsonic.initd" madsonic || die
	newconfd "${FILESDIR}/madsonic.confd" madsonic || die

	make_wrapper ${MY_PN} "${dir}/madsonic.sh" || die

	if use ffmpeg; then
		dodir ${MADSONIC_HOME}/transcode
		dosym /usr/bin/ffmpeg ${MADSONIC_HOME}/transcode/ffmpeg || die
	fi

	if use lame; then
		dodir ${MADSONIC_HOME}/transcode
		dosym /usr/bin/lame ${MADSONIC_HOME}/transcode/lame || die
	fi
    if use systemd; then
        dodir /run/madsonic
		fowners ${USER_GROUP}:${USER_GROUP} /run/madsonic || die
		# Compartible systemd mode
		systemd_dounit "${FILESDIR}"/madsonic.service
		systemd_dotmpfilesd "${FILESDIR}"/madsonic.conf
		# True systemd mode
		#systemd_newunit "${FILESDIR}"/madsonic.service.true madsonic.service
		#systemd_install_serviced "${FILESDIR}"/madsonic.service.conf
    fi
    if use xmp; then
        dodir ${MADSONIC_HOME}/transcode
        dosym /usr/bin/xmp ${MADSONIC_HOME}/transcode/xmp || die
    fi
}

