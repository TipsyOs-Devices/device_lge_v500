#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := AWIFI
TARGET_BOOTLOADER_NAME := awifi
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8960

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel
TARGET_KERNEL_SOURCE := kernel/lge/awifi
TARGET_KERNEL_CONFIG := cyanogenmod_v500_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 lpj=67677 androidboot.hardware=awifi vmalloc=400M
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_CUSTOM_BOOTIMG_MK := device/lge/awifi/mkbootimg.mk
BOARD_CUSTOM_BOOTIMG := true

# Assert
TARGET_OTA_ASSERT_DEVICE := awifi,v500

# Audio
BOARD_USES_ALSA_AUDIO:= true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/awifi/bluetooth

# Camera
BOARD_USES_LEGACY_MMAP := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_DISPLAY_USE_RETIRE_FENCE := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Hardware tunables
BOARD_HARDWARE_CLASS := device/lge/awifi/cmhw/

# Partitions
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 25165824    # 24M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824    # 24M
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2248146944  # 2144M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12071206912 # 11512M
BOARD_CACHEIMAGE_PARTITION_SIZE    := 838860800   # 800M
BOARD_FLASH_BLOCK_SIZE             := 131072      # (BOARD_KERNEL_PAGESIZE * 64)

# Recovery
TARGET_RECOVERY_FSTAB := device/lge/awifi/rootdir/etc/fstab.awifi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux policies
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += device/lge/awifi/sepolicy

BOARD_SEPOLICY_UNION += \
        bluetooth_loader.te \
        device.te \
        irrcServer.te \
        kernel.te

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

# inherit from the proprietary version
-include vendor/lge/awifi/BoardConfigVendor.mk
