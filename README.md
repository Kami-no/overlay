# Gentoo Overlay
Small personal overlay to sync rare ebuilds.

**/etc/portage/repos.conf/kami-no.conf**

```
[kami-no]
location = /usr/local/overlay/kami-no
sync-type = git
sync-uri = https://github.com/Kami-no/overlay.git
auto-sync = yes
```

## Music
### beets
A media library management system for obsessive-compulsive music geeks. CLI-only. http://beets.radbox.org/
### Subsonic
Subsonic is a complete, personal media streaming solution. Has premium features with subscription. http://www.subsonic.org/pages/index.jsp
### Madsonic
Fork of Subsinic. Has more features but less intuitive interface. Has premium features with subscription, but you can get the key for free at the developer's forum. http://beta.madsonic.org/pages/index.jsp

Extra dependancies:
- **xmp** - Extended Module Player - used for transcoding http://xmp.sourceforge.net/;
- **libxmp** - library that renders module files to PCM data - new version of xmp moved it's features to this library http://xmp.sourceforge.net/.

## Net
### ocserv
Free server for Cisco AnyConnect. http://www.infradead.org/ocserv/
### sniproxy
Proxies incoming HTTP and TLS connections based on the hostname contained in the initial request of the TCP session. https://github.com/dlundquist/sniproxy

## Misc
### terminix
A tiling terminal emulator for Linux using GTK+ 3. https://github.com/gnunn1/terminix

## Abandoned
- pf-sources
- uksmtools 

