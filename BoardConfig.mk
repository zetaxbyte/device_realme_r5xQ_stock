#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/r5xQ

# SCREEN HEIGHT AND WIDTH
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := trinket
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 earlycon=msm_geni_serial,0x4a90000 loop.max_part=7 cgroup.memory=nokmem,nosocket buildvariant=userdebug androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := r5xQ_defconfig
TARGET_KERNEL_SOURCE := kernel/realme/r5xQ

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Platform
TARGET_BOARD_PLATFORM := trinket

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/props/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/props/product.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/props/odm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2022-01-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit the proprietary files
include vendor/realme/r5xQ/BoardConfigVendor.mk
