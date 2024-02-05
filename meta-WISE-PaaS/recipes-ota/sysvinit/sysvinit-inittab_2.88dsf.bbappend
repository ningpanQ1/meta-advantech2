do_install:append:mx6() {

    echo "ota::sysinit:/bin/mkdir /cache" >> ${D}${sysconfdir}/inittab
    echo "null::sysinit:/bin/mount -a" >> ${D}${sysconfdir}/inittab
}
