################################################################################
#
# powerpc-utils
#
################################################################################

POWERPC_UTILS_VERSION = 1.2.24
POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
POWERPC_UTILS_DEPENDENCIES = zlib
POWERPC_UTILS_LICENSE = Common Public License Version 1.0
POWERPC_UTILS_LICENSE_FILES = COPYRIGHT

POWERPC_UTILS_CONF_ENV = \
	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)

ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
POWERPC_UTILS_DEPENDENCIES += librtas
POWERPC_UTILS_CONF_OPTS = --with-librtas
else
POWERPC_UTILS_CONF_OPTS = --without-librtas
endif

$(eval $(autotools-package))
