include $(TOPDIR)/rules.mk

PKG_NAME:=wp_module
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=wpglinet
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/wp_module
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=wp Simple Shell Module
  DEPENDS:=
  PKGARCH:=all
endef

define Package/wp_module/description
  A simple module to modify default settings on first boot.
endef

define Build/Compile
  # Nothing to compile
endef

define Package/wp_module/install
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_BIN) ./files/wp-simple-init.sh $(1)/etc/init.d/wp-simple-init
endef

$(eval $(call BuildPackage,wp_module))
