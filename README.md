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
#### Subsonic
Subsonic is a complete, personal media streaming solution. Has premium features with subscription. http://www.subsonic.org/pages/index.jsp
#### Madsonic
Forked from Subsinic. Has more features but less intuitive interface. Has premium features with subscription, but you can get the key for free at the developer's forum. http://beta.madsonic.org/pages/index.jsp

### Net
#### gobetween
Modern & minimalistic load balancer for the Cloud era http://gobetween.io/

### Misc
#### tilix (ex terminix)
A tiling terminal emulator for Linux using GTK+ 3. https://github.com/gnunn1/tilix

