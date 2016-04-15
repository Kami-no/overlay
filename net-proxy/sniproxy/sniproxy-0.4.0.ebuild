# Copyright 2014 CyberFilter.Ru
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"

inherit git-2 eutils autotools systemd

EGIT_REPO_URI="https://github.com/dlundquist/sniproxy.git"
EGIT_COMMIT=$PV

DESCRIPTION="Proxies incoming HTTP and TLS connections based on the hostname contained in the initial request of the TCP session"
HOMEPAGE="https://github.com/dlundquist/sniproxy"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="cyberfilter systemd"

RDEPEND=">=net-libs/udns-0.4
	 dev-libs/libev
	 dev-libs/libpcre"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf --install
	eautomake --add-missing --copy
}

src_install() {

	default_src_install
	
    insinto /etc/
    newinitd "${FILESDIR}/sniproxy.initd" sniproxy

    if use systemd ; then
        systemd_dounit "${FILESDIR}/sniproxy.service"
	fi

	if use cyberfilter ; then
	    doins "${FILESDIR}/sniproxy.conf"
	else
	    doins "${S}/sniproxy.conf"
	fi;

	fperms 0644 /etc/sniproxy.conf

	keepdir /var/log/sniproxy
	fperms 0755 /var/log/sniproxy
	fowners nobody:nobody /var/log/sniproxy
}

