BRANCH ?= "ti-u-boot-2023.04"
UBOOT_GIT_URI = "git://github.com/ningpanQ1/am335x-uboot.git"
UBOOT_GIT_PROTOCOL = "https"
SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"

SRCREV = "5d466b8538c231b6fac325317e5437773ff35c15"
