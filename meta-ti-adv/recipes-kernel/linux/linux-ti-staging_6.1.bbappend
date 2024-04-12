BRANCH = "ti-linux-6.1.y"
KERNEL_GIT_PROTOCOL = "https"
KERNEL_GIT_URI = "git://github.com/ningpanQ1/am335x-kernel.git"

SRCREV = "5db49417da39a6fba2155051c42aa6f87899442d"
KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}"

do_configure:append() {
    # Always copy the defconfig file to .config to keep consistency
    # between the case where there is a real config and the in kernel
    # tree config

	if [ "${SOC_FAMILY}" = "ti-soc:ti33x" ] ; then
        cp ${S}/arch/arm/configs/am335x_adv_defconfig ${B}/.config
		cp ${S}/arch/arm/configs/am335x_adv_defconfig ${WORKDIR}/defconfig
    fi
}
