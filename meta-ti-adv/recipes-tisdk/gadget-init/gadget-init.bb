DESCRIPTION = "Units to initialize usb gadgets"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r0"

COMPATIBLE_MACHINE = "ti33x"

RDEPENDS:${PN} += "busybox-udhcpd"

SRC_URI = "file://storage-gadget-init.service \
           file://storage-gadget-init.sh \
"

inherit systemd

SYSTEMD_SERVICE:{PN} = "storage-gadget-init.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/storage-gadget-init.sh ${D}${bindir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/storage-gadget-init.service ${D}${systemd_system_unitdir}
}

FILES:${PN} = " \
	${bindir}/storage-gadget-init.sh \
	${systemd_system_unitdir}/storage-gadget-init.service \
"

RRECOMMENDS:${PN} += "kernel-module-g_mass_storage"
