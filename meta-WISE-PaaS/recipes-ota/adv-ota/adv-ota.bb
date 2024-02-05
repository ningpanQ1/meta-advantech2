SUMMARY = "Main program for OTA update in recovery mode"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "file://adv-ota.sh "
SRC_URI:append:armv7a = "file://adv-reboot-32 "
SRC_URI:append:aarch64 = "file://adv-reboot-64 "

S = "${WORKDIR}"

do_install() {
    mkdir -p ${D}/tools
    install -d ${D}/tools

    install -m 755 ${WORKDIR}/adv-ota.sh ${D}/tools/adv-ota.sh

    if [ -e ${WORKDIR}/adv-reboot-32 ] ; then
        install -m 755 ${WORKDIR}/adv-reboot-32 ${D}/tools/adv-reboot
    fi
    if [ -e ${WORKDIR}/adv-reboot-64 ] ; then
        install -m 755 ${WORKDIR}/adv-reboot-64 ${D}/tools/adv-reboot
    fi
}

RDEPENDS:${PN} += "bash"
FILES:${PN} = "/tools"

