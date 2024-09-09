#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/AI2205

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    odm \
    system \
    system_dlkm \
    product \
    system_ext \
    vendor \
    vendor_dlkm \
    vendor_boot \
    recovery \
    boot

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
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_USES_REMOTEPROC := true

# Build Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# FBE Decryption, QCOM
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_NO_KERNEL_OVERRIDE := true

# Partitions, Board
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_USES_METADATA_PARTITION := true

# Partition, Information
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Partitions, Sizes
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOTIMAGE_PARTITION_SIZE := 8388608

# Partitions, Super
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := asus_dynamic_partitions
BOARD_ASUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm vendor_dlkm
BOARD_ASUS_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Partitions, Type
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform
BOARD_USES_QCOM_HARDWARE := true
PRODUCT_PLATFORM := kalama
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
QCOM_BOARD_PLATFORMS += $(PRODUCT_PLATFORM)
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USES_MKE2FS := true

# Recovery, Extras
BOARD_ROOT_EXTRA_FOLDERS += \
    batinfo \
    ADF \
    APD \
    asdf

# Recovery, Ramdisk
BOARD_RAMDISK_USE_LZ4 := true

# Recovery, Root
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# SPL
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# TWRP Configuration
TW_INCLUDE_CRYPTO := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_NO_EXFAT_FUSE := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_QCOM_ATS_OFFSET := 1666528204500
TW_EXCLUDE_APEX := true
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone39/temp"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 200
TW_MAX_BRIGHTNESS := 1051
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko rproc_qcom_common.ko qcom_q6v5.ko qcom_q6v5_pas.ko qcom_sysmon.ko twrp.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_NO_FLASH_CURRENT_TWRP := true
TW_USE_LEGACY_BATTERY_SERVICES := true

# TWRP Debugging
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# TWRP Device Version
# TW_DEVICE_VERSION := Exia

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Workaround for copying files during the process: TARGET_COPY_OUT_<PARTITION> := <partition>
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
