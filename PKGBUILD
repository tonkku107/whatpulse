# Maintainer: Tonkku <contact@tonkku.me>
# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=3.3
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org
# I have yet to find the actual licence, but alternatively: it's basically freeware
license=(custom:whatpulse_tos)
install="$pkgname.install"
depends=('qt5-svg')
makedepends=('squashfs-tools')
_snapid="iHVATX2faqAJciG5YGNM241W8fE8UvsF"
_snaprev="8"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap" "LICENSE")
sha256sums=('36aba7cdb99a93504e324dff3d2b52b094c826a45bae1f80e9e1066f19f4506f'
            'b6ce2dada6ac7514dd9b74682939a4b5960343411469676cafb0d27d1530ad02')

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
    cd $srcdir/

    # Install the binary
    mkdir -p ${pkgdir}/usr/bin
    install -m0755 whatpulse/usr/bin/whatpulse ${pkgdir}/usr/bin/whatpulse

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/whatpulse.png|whatpulse|g' "${pkgname}/meta/gui/whatpulse.desktop"
    install -Dm644 "${pkgname}/meta/gui/whatpulse.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgname}/meta/gui/whatpulse.png" "${pkgdir}/usr/share/pixmaps/whatpulse.png"
    
    # Install the input rules 
    mkdir -p ${pkgdir}/etc/udev/rules.d/
    cat >${pkgdir}/etc/udev/rules.d/99-whatpulse-input.rules <<__EOF__
KERNEL=="event*", NAME="input/%k", MODE="640", GROUP="input"
__EOF__

    # Install license
    install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/whatpulse/LICENSE
}
