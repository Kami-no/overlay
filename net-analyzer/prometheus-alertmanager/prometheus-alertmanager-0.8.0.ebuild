# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit golang-base user

DESCRIPTION="Prometheus Alertmanager"
HOMEPAGE="https://github.com/prometheus/alertmanager"
EGO_PN="github.com/prometheus/alertmanager"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""

DEPEND=">=dev-lang/go-1.5"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src/${EGO_PN}"

DAEMON_USER="prometheus"
LOG_DIR="/var/log/prometheus"
DATA_DIR="/var/lib/prometheus"

pkg_setup() {
	enewuser ${DAEMON_USER} -1 -1 "${DATA_DIR}"
}

src_unpack() {
	default
	mkdir -p ${P}/src/${EGO_PN%/*} || die
	mv alertmanager-${PV} ${P}/src/${EGO_PN} || die
}

src_compile() {
	export GOPATH="${WORKDIR}/${P}"
	export PREFIX="${S}/alertmanager"
	cd ${S}
	#einfo "GOPATH: $(export | grep -i gopath)"
	#einfo "GOROOT: $(export | grep -i goroot)"
	#einfo "Go Version: $(go version)"
	#einfo "PWD: $(pwd)"
	emake build
}

src_install() {
	newbin "alertmanager/alertmanager" "${PN}"
	
    insinto "/etc/prometheus"
    newins "${FILESDIR}/${PN}.yaml" "alertmanager.yaml"

    newinitd "${FILESDIR}/${PN}-initd" "${PN}"
    newconfd "${FILESDIR}/${PN}-confd" "${PN}"

    keepdir "${LOG_DIR}"
    fowners "${DAEMON_USER}" "${LOG_DIR}"

    keepdir "${DATA_DIR}/alertmanager"
    fowners "${DAEMON_USER}" "${DATA_DIR}/alertmanager"
}
