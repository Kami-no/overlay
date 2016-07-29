# Gentoo Overlay
Small personal overlay to sync rare ebuilds.

## Installation

**/etc/portage/repos.conf/kami-no.conf**

```
[kami-no]
location = /usr/local/overlay/kami-no
sync-type = git
sync-uri = https://github.com/Kami-no/overlay.git
auto-sync = yes
```

## Packages

### Music
#### beets
The purpose of beets is to get your music collection right once and for all. It catalogs your collection, automatically improving its metadata as it goes using the MusicBrainz database. Then it provides a bouquet of tools for manipulating and accessing your music. CLI-only. http://beets.radbox.org/
#### Subsonic
Subsonic is a complete, personal media streaming solution. Has premium features with subscription. http://www.subsonic.org/pages/index.jsp
#### Madsonic
Forked from Subsinic. Has more features but less intuitive interface. Has premium features with subscription, but you can get the key for free at the developer's forum. http://beta.madsonic.org/pages/index.jsp

Extra dependancies:
- **xmp** - Extended Module Player - used for transcoding http://xmp.sourceforge.net/;
- **libxmp** - library that renders module files to PCM data - new version of xmp moved it's features to this library http://xmp.sourceforge.net/.

### Net
#### ocserv
OpenConnect server (ocserv) is an SSL VPN server. Its purpose is to be a secure, small, fast and configurable VPN server. It implements the OpenConnect SSL VPN protocol, and has also (currently experimental) compatibility with clients using the AnyConnect SSL VPN protocol. The OpenConnect protocol provides a dual TCP/UDP VPN channel, and uses the standard IETF security protocols to secure it. The server is implemented primarily for the GNU/Linux platform but its code is designed to be portable to other UNIX variants as well. http://www.infradead.org/ocserv/
#### sniproxy
Proxies incoming HTTP and TLS connections based on the hostname contained in the initial request of the TCP session. This enables HTTPS name-based virtual hosting to separate backend servers without installing the private key on the proxy machine. https://github.com/dlundquist/sniproxy

### Misc
#### terminix
A tiling terminal emulator for Linux using GTK+ 3. https://github.com/gnunn1/terminix

### Abandoned
- pf-sources
- uksmtools 

