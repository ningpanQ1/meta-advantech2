SUMMARY = "Shell scripts for OTA update"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "file://do_update.sh \
           file://do_update_mbed.sh"

do_install() {
    mkdir -p ${D}/tools
    install -d ${D}/tools

    install -m 755 ${WORKDIR}/do_update.sh ${D}/tools/
    install -m 755 ${WORKDIR}/do_update_mbed.sh ${D}/tools/
}

RDEPENDS:${PN} += "bash"
FILES:${PN} = "/tools"
