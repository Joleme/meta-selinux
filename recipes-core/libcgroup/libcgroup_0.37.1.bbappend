PR .= ".2"

SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v${PV}/${BPN}-${PV}.tar.bz2"

EXTRA_OECONF_virtclass-native = "--enable-pam=no"

do_install_append() {
	test ! -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 || {
		mv -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ${D}${base_libdir}/security/pam_cgroup.so
		rm -f ${D}${base_libdir}/security/pam_cgroup.so.*
	}
}

BBCLASSEXTEND = "native"
