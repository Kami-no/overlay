EAPI=5

inherit golang-base user systemd git-2

DESCRIPTION="Modern & minimalistic load balancer for the Cloud era"
HOMEPAGE="http://gobetween.io/"

PV="rc4"

#APP_PKG="${PN}_${PV}_linux_amd64"
#SRC_URI="https://github.com/pingcap/${PN}/archive/rc4.tar.gz -> ${PN}-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/pingcap/tidb.git"
EGIT_COMMIT="6e0ff81269d49ffec39066d5110ee28f7fe67f2f"

LICENSE="apache"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND=">=dev-lang/go-1.8"
RDEPEND=""

APP_USER="tidb"
#S="${WORKDIR}/${PN}-${PV}"

pkg_setup() {
    enewuser "${APP_USER}" -1 -1 -1
}

src_compile() {
    #strip-flags
    #echo ${WORKDIR}
    export GOPATH="${S}/_vendor"
	#export GOROOT=${GOPATH}/_vendor
	#export GOPATH="${WORKDIR}/${PN}-${PV}"
    #export PREFIX="${S}/${PN}"
	#emake deps
    ln -s ${S} ${S}/_vendor/src/github.com/pingcap/tidb
    #emake build
	#emake
	#make
	cd ${S}
	GOPATH=${S} CGO_ENABLED=0 go build -o bin/tidb-server tidb-server/main.go
}

src_install() {
    dosbin bin/tidb-server
    dodoc README.md
	dodoc docs/*

    #keepdir /var/lib/prometheus/${PN} /var/log/prometheus
    #fowners ${APP_USER} /var/lib/gobetween/${PN} /var/log/prometheus

    #insinto /etc
	#doins config/gobetween.toml

    #newinitd "${FILESDIR}/${PN}.initd" "${PN}"
    #newconfd "${FILESDIR}/${PN}.confd" "${PN}"

    #if use systemd; then
    #    systemd_dounit "config/systemd/${PN}.service"
    #fi

    #insinto /etc/default
    #newins "${FILESDIR}/${PN}.default" "${PN}"
}
