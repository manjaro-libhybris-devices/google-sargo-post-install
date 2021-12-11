# Maintainer: Erik Inkinen <erik.inkinen@gmail.com>

pkgname=volla-yggdrasil-post-install
provides=(halium9-post-install)
conflicts=(halium9-post-install)
pkgver=20$(date +%y%m%d)
pkgrel=5
pkgdesc="Manjaro ARM's Volla Phone post install script"
arch=('any')
url="https://www.manjaro.org"
license=('GPL')
depends=('gzip' 'glibc-locales' 'wget' 'systemd')
makedepends=('git')
source=("volla-yggdrasil-post-install::git+https://github.com/manjaro-libhybris/volla-yggdrasil-post-install.git")
install=$pkgname.install
md5sums=('SKIP')

package() {
    mv "${srcdir}/volla-yggdrasil-post-install/volla-yggdrasil-post-install.sh" "${srcdir}/volla-yggdrasil-post-install/volla-yggdrasil-post-install"
    install -Dm755 "${srcdir}/volla-yggdrasil-post-install/volla-yggdrasil-post-install" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/volla-yggdrasil-post-install.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/wifi-fix.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/android.conf" -t "${pkgdir}/usr/lib/sysusers.d/"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/lomiri-gtk.css" "${pkgdir}/opt/volla-yggdrasil-post-install/lomiri/gtk.css"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/ril_subscription.conf" "${pkgdir}/etc/ofono/ril_subscription.conf"
    cp -r "${srcdir}/volla-yggdrasil-post-install/modules" "${pkgdir}/usr/lib"

    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/phoc.ini" -t "${pkgdir}/etc/phosh/"
    cp -r "${srcdir}/volla-yggdrasil-post-install/udev" -t "${pkgdir}/etc"
    cp -r "${srcdir}/volla-yggdrasil-post-install/modules-load.d" -t "${pkgdir}/etc"

    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/boot.img" -t "${pkgdir}/boot/"
    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/dtbo.img" -t "${pkgdir}/boot/"

    install -d "${pkgdir}/opt/halium-overlay"
    cp -r "${srcdir}/volla-yggdrasil-post-install/vendor-overlay" "${pkgdir}/opt/volla-yggdrasil-post-install/"
    ln -s "/opt/volla-yggdrasil-post-install/vendor-overlay" "${pkgdir}/opt/halium-overlay/vendor"

    install -Dm644 "${srcdir}/volla-yggdrasil-post-install/90_manjaro.gschema.override" -t "${pkgdir}/usr/share/glib-2.0/schemas"
}
