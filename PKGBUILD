# Maintainer: Bardia Moshiri <fakeshell@bardia.tech>

pkgname=google-sargo-post-install
provides=(halium9-post-install)
conflicts=(halium9-post-install)
pkgver=21$(date +%y%m%d)
pkgrel=4
pkgdesc="Manjaro libhybris post install script for google sargo/bonito"
arch=('any')
url="https://github.com/manjaro-libhybris-devices/google-sargo-post-install"
license=('GPL')
depends=('gzip' 'glibc-locales' 'wget' 'systemd')
makedepends=('git')
source=("google-sargo-post-install::git+https://github.com/manjaro-libhybris-devices/google-sargo-post-install.git")
install=$pkgname.install
md5sums=('SKIP')

package() {
    mv "${srcdir}/google-sargo-post-install/google-sargo-post-install.sh" "${srcdir}/google-sargo-post-install/google-sargo-post-install"

    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/google-sargo-post-install/google-sargo-post-install" -t "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/google-sargo-post-install/google-sargo-post-install.service" -t "${pkgdir}/usr/lib/systemd/system/"
    mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
    install -Dm644 "${srcdir}/google-sargo-post-install/android.conf" -t "${pkgdir}/usr/lib/sysusers.d/"

    mkdir -p ${pkgdir}/etc/phosh/
    install -Dm644 "${srcdir}/google-sargo-post-install/phoc.ini" -t "${pkgdir}/etc/phosh/"
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    cp -r "${srcdir}/google-sargo-post-install/70-sargo.rules" -t "${pkgdir}/etc/udev/rules.d/"

    mkdir -p "${pkgdir}/boot/"
    install -Dm644 "${srcdir}/google-sargo-post-install/boot.img" -t "${pkgdir}/boot/"
    install -Dm644 "${srcdir}/google-sargo-post-install/dtbo.img" -t "${pkgdir}/boot/"
    install -Dm644 "${srcdir}/google-sargo-post-install/vbmeta.img" -t "${pkgdir}/boot/"

    mkdir -p "${pkgdir}/usr/share/glib-2.0/schemas/"
    install -Dm644 "${srcdir}/google-sargo-post-install/90_manjaro.gschema.override" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
