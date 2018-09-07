# 
# Copyright (C) 2012-2015 OpenWrt.org
# Copyright (C) 2016-2017 LEDE project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

FAT32_BLOCK_SIZE=1024
FAT32_BLOCKS=$(shell echo $$(($(CONFIG_BRCM2708_SD_BOOT_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Build/Compile
	$(CP) $(LINUX_DIR)/COPYING $(KDIR)/COPYING.linux
endef

### Image scripts ###
define Build/boot-img
	rm -f $@.boot
	mkfs.fat -C $@.boot $(FAT32_BLOCKS)
	mcopy -i $@.boot $(KDIR)/COPYING.linux ::
	mcopy -i $@.boot $(KDIR)/bootcode.bin ::
	mcopy -i $@.boot $(KDIR)/LICENCE.broadcom ::
	mcopy -i $@.boot $(KDIR)/start.elf ::
	mcopy -i $@.boot $(KDIR)/start_cd.elf ::
	mcopy -i $@.boot $(KDIR)/fixup.dat ::
	mcopy -i $@.boot $(KDIR)/fixup_cd.dat ::
	mcopy -i $@.boot cmdline.txt ::
	mcopy -i $@.boot config.txt ::
	mcopy -i $@.boot $(IMAGE_KERNEL) ::$(KERNEL_IMG)
	$(foreach dts,$(shell echo $(DEVICE_DTS)),mcopy -i $@.boot $(DTS_DIR)/$(dts).dtb ::;)
endef

define Build/sdcard-img
	./gen_rpi_sdcard_img.sh $@ $@.boot $(IMAGE_ROOTFS) \
		$(CONFIG_BRCM2708_SD_BOOT_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE)
endef

### Devices ###
define Device/Default
  KERNEL := kernel-bin
  KERNEL_IMG := kernel.bin
  IMAGES := factory.img.gz sysupgrade.img.gz
  IMAGE/sysupgrade.img.gz := boot-img | sdcard-img | gzip | append-metadata
  IMAGE/factory.img.gz := boot-img | sdcard-img | gzip
endef

define Device/rpi
  DEVICE_TITLE := Raspberry Pi B/B+
  DEVICE_DTS := bcm2835-rpi-b bcm2835-rpi-b-plus
  SUPPORTED_DEVICES := raspberrypi,model-b raspberrypi,model-b-plus
endef

define Device/rpi-zero-w
  DEVICE_TITLE := Raspberry Pi Zero/ZeroW
  DEVICE_DTS := bcm2835-rpi-zero-w
  SUPPORTED_DEVICES := raspberrypi,model-zero-w
  DEVICE_PACKAGES := brcmfmac-firmware-43430-sdio brcmfmac-board-rpi3-b kmod-brcmfmac wpad-mini
endef
ifeq ($(SUBTARGET),bcm2708)
  TARGET_DEVICES += rpi rpi-zero-w
endif

define Device/rpi-2
  DEVICE_TITLE := Raspberry Pi 2B
  DEVICE_DTS := bcm2836-rpi-2-b
  SUPPORTED_DEVICES := raspberrypi,2-model-b
endef

define Device/rpi-3-32b
  DEVICE_TITLE := Raspberry Pi 3B/3B+ 32bit
  DEVICE_DTS := bcm2837-rpi-3-b bcm2837-rpi-3-b-plus
  SUPPORTED_DEVICES := raspberrypi,3-model-b raspberrypi,3-model-b-plus
  DEVICE_PACKAGES := brcmfmac-firmware-43430-sdio brcmfmac-firmware-43455-sdio brcmfmac-board-rpi3-b brcmfmac-board-rpi3-b-plus kmod-brcmfmac wpad-mini
endef
ifeq ($(SUBTARGET),bcm2709)
  TARGET_DEVICES += rpi-2 rpi-3-32b
endif

define Device/rpi-3-64b
  DEVICE_TITLE := Raspberry Pi 3B/3B+ 64bit 
  DEVICE_DTS := bcm2837-rpi-3-b bcm2837-rpi-3-b-plus
  SUPPORTED_DEVICES := raspberrypi,3-model-b raspberrypi,3-model-b-plus
  DEVICE_PACKAGES := brcmfmac-firmware-43430-sdio brcmfmac-board-rpi3-b brcmfmac-firmware-43455-sdio brcmfmac-board-rpi3-b-plus kmod-brcmfmac wpad-mini
endef
ifeq ($(SUBTARGET),bcm2710)
  TARGET_DEVICES += rpi-3-64b
endif

$(eval $(call BuildImage))
