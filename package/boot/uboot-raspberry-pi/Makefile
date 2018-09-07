#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=2018.07
PKG_RELEASE:=1

PKG_HASH:=9f10df88bc91b35642e461217f73256bbaeeca9ae2db8db56197ba5e89e1f6d4

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define U-Boot/Default
  BUILD_TARGET:=brcm2708
  UBOOT_IMAGE:=u-boot.img
endef

define U-Boot/rpi
  NAME:=Raspberry Pi B Board
  BUILD_DEVICES:= rpi
endef

define U-Boot/rpi_2
  NAME:=Raspberry Pi 2 B Board
  BUILD_DEVICES:= rpi-2-b
endef

define U-Boot/rpi_zero-w
  NAME:=Raspberry Pi Zero W Board
  UBOOT_CONFIG:= rpi_0_w
  BUILD_DEVICES:= rpi-zero-w
endef

define U-Boot/rpi_3_32b
  NAME:=Raspberry Pi 3 B/B+ 32bit Boards
  BUILD_DEVICES:= rpi-3-b-32b rpi-3-b-plus-32b
endef

define U-Boot/rpi_3
  NAME:=Raspberry Pi 3 B/B+ 64bit Boards
  BUILD_DEVICES:= rpi-3-b-64b rpi-3-b-plus-64b
endef

UBOOT_TARGETS := \
	rpi \
	rpi_2 \
	rpi_zero-w \
	rpi_3_32b \
  rpi_3

Build/Exports:=$(Host/Exports)

$(eval $(call BuildPackage/U-Boot))
