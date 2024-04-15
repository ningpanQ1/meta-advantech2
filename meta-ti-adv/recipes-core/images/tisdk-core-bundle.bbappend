
ADDON_MK_EMMC_DIR:="${THISDIR}/files/mk_emmc"

TARGET_IMAGES:append = " \
	initramfs-debug-image \
"

#Avoid building thinlinux-image and base-image while generating tisdk-core-bundle for PROC SDK
TARGET_IMAGES:remove = " \
	tisdk-thinlinux-image \
	tisdk-base-image \
"

TARGET_IMAGE_TYPES:remove = " \
	ubi \
	wic.xz \
	wic.gz \
"

DEPLOY_IMAGES_NAME:append:am335xepcr3220a1 = " \
	extlinux.conf \
"

tisdk_add_mkemmc_script() {
        install -m 0755 ${ADDON_MK_EMMC_DIR}/* ${IMAGE_ROOTFS}/bin  

        if [ "${SOC_FAMILY}" = "ti-soc:ti33x" ]; then
                sed -i "262a  sysctl vm.min_free_kbytes=16384" ${IMAGE_ROOTFS}/bin/mk-eMMC-boot.sh
        fi 
}

tisdk_image_build_add_initramfs () {
    cp ${DEPLOY_DIR_IMAGE}/initramfs-debug-image-${MACHINE}.cpio.gz ${IMAGE_ROOTFS}/filesystem/
}

ROOTFS_POSTPROCESS_COMMAND:append = "tisdk_add_mkemmc_script; tisdk_image_build_add_initramfs;"
