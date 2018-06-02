define Device/rb-map-2nd
 ATH_SOC := qca9531
 DEVICE_TITLE := MikroTik RouterBoard mAP 2nD
 DEVICE_PACKAGES := rbcfg kmod-ledtrig-gpio kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
 IMAGE_SIZE := 16000k
 LOADER_TYPE := elf
 KERNEL_INSTALL := 1
 KERNEL := kernel-bin | append-dtb | lzma | loader-kernel
 IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
 SUPPORTED_DEVICES := mikrotik,rb-map-2nd rb-map-2nd
endef
TARGET_DEVICES += rb-map-2nd
