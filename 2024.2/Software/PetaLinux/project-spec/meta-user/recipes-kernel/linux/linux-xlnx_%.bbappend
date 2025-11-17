FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg \
		   file://0001-3-lane-patch-mrmac.patch"
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2025-02-19-21-00-00.cfg"

