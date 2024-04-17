BRANCH ?= "ti-u-boot-2023.04"
UBOOT_GIT_URI = "git://github.com/ningpanQ1/am335x-uboot.git"
UBOOT_GIT_PROTOCOL = "https"
SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"

SRCREV = "81114a16f00a999d967f6a48946e23ae3a241d5d"
