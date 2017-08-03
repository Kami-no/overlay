EAPI=6

inherit golang-base user systemd

DESCRIPTION="Modern & minimalistic load balancer for the Cloud era"
HOMEPAGE="http://gobetween.io/"

APP_PKG="${PN}_${PV}_linux_amd64"
#SRC_URI="https://github.com/yyyar/${PN}/releases/download/${PV}/${APP_PKG}.tar.gz"
SRC_URI="https://github.com/yyyar/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND=">=dev-lang/go-1.8"
RDEPEND=""

APP_USER="gobetween"
#S="${WORKDIR}/${APP_PKG}"

pkg_setup() {
    enewuser "${APP_USER}" -1 -1 -1
}

src_compile() {
    echo ${WORKDIR}
    export GOPATH="${WORKDIR}/${P}"
    export PREFIX="${S}/${PN}"
	emake deps
    emake build
}

src_install() {
    dosbin bin/${PN}
    dodoc README.md

    #keepdir /var/lib/prometheus/${PN} /var/log/prometheus
    #fowners ${APP_USER} /var/lib/gobetween/${PN} /var/log/prometheus

    insinto /etc
	doins config/gobetween.toml

    #newinitd "${FILESDIR}/${PN}.initd" "${PN}"
    #newconfd "${FILESDIR}/${PN}.confd" "${PN}"

    if use systemd; then
        systemd_dounit "config/systemd/${PN}.service"
    fi

    #insinto /etc/default
    #newins "${FILESDIR}/${PN}.default" "${PN}"
}
