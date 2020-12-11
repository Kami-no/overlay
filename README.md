# Gentoo Overlay
Small personal overlay to sync rare and custom ebuilds.

## Installation

**/etc/portage/repos.conf/kami-no.conf**

```
[kami-no]
location = /var/lib/portage/repos/kami-no
sync-type = git
sync-uri = https://github.com/Kami-no/overlay.git
auto-sync = yes
```

## Packages

### Monitoring
#### Prometheus Alertmanager
The Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integrations such as email, PagerDuty, or OpsGenie. It also takes care of silencing and inhibition of alerts. https://github.com/prometheus/alertmanager
#### Prometheus Blackbox exporter
The blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP. https://github.com/prometheus/blackbox_exporter

### Music
#### beets
The purpose of beets is to get your music collection right once and for all. It catalogs your collection, automatically improving its metadata as it goes using the MusicBrainz database. Then it provides a bouquet of tools for manipulating and accessing your music. CLI-only. http://beets.radbox.org/

#### Subsonic
Subsonic is a complete, personal media streaming solution. Has premium features with subscription. http://www.subsonic.org/pages/index.jsp
#### Madsonic
Forked from Subsinic. Has more features but less intuitive interface. Has premium features with subscription, but you can get the key for free at the developer's forum. http://beta.madsonic.org/pages/index.jsp

### Net
#### gobetween
Modern & minimalistic load balancer for the Cloud era http://gobetween.io/
#### ocserv
OpenConnect server (ocserv) is an SSL VPN server. Its purpose is to be a secure, small, fast and configurable VPN server. It implements the OpenConnect SSL VPN protocol, and has also (currently experimental) compatibility with clients using the AnyConnect SSL VPN protocol. The OpenConnect protocol provides a dual TCP/UDP VPN channel, and uses the standard IETF security protocols to secure it. The server is implemented primarily for the GNU/Linux platform but its code is designed to be portable to other UNIX variants as well. http://www.infradead.org/ocserv/

### Misc
#### tilix (ex terminix)
A tiling terminal emulator for Linux using GTK+ 3. https://github.com/gnunn1/tilix

