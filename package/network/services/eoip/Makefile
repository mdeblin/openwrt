include $(TOPDIR)/rules.mk

PKG_NAME:=eoip
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Nat-Lab/eoip.git
PKG_SOURCE_DATE:=2018-01-26
PKG_SOURCE_VERSION:=82b94504f7bd3612280e3b3826a9122f342884a3
PKG_MIRROR_HASH:=11ec48bf6fe553d3fa4f43e61ba00c005c116a6574b781dc751d7a361fe27ace

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/eoip
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Linux implementation of Mikrotik EOIP
  DEPENDS:=+kmod-tun +kmod-gre +gre
endef

define Package/eoip/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/eoip $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,eoip))
