
IMAGE_INSTALL:append = " ppp "


# timezone
IMAGE_INSTALL:append = " tzdata "

# minicom
IMAGE_INSTALL:append = " minicom "

IMAGE_INSTALL:append = " \
   cmake \
   mosquitto-clients mosquitto mosquitto-dev \
   libxml2 libxml2-dev \
   git-perltools \
   openobex \
   openobex-dev \
   python3-pybluez \
"
TOOLCHAIN_TARGET_TASK:append = " \
   cmake \
   git git-perltools \
   curl curl-dev \
   mosquitto-clients mosquitto mosquitto-dev \
   libxml2 libxml2-dev \
   linux-libc-headers-dev \
   openobex \
   glibc-staticdev \
"

INHERIT += "own-mirrors"
SOURCE_MIRROR_URL = "http://software-dl.ti.com/processor-sdk-mirror/sources/"


