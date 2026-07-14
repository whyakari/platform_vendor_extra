#
# Copyright (C) 2025 LumineDroid
#
# SPDX-License-Identifier: Apache-2.0
#

EXTRA_PATH := vendor/extra

# BlackTheme
PRODUCT_PACKAGES += \
    AndroidBlackThemeOverlay

# Bootanimation
include $(EXTRA_PATH)/config/bootanimation.mk

# Charger
WITH_LINEAGE_CHARGER := false
PRODUCT_PACKAGES += \
    custom_charger_animation \
    custom_charger_animation_vendor

# Enable blur
TARGET_ENABLE_BLUR ?= true
ifeq ($(TARGET_ENABLE_BLUR),true)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=true \
    ro.surface_flinger.supports_background_blur=1
else
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=false \
    ro.surface_flinger.supports_background_blur=0
endif

# Enable Material Design 3 Expressive
PRODUCT_PRODUCT_PROPERTIES += \
    is_expressive_design_enabled=true

# Fonts
$(call inherit-product, vendor/extra/fonts/fonts.mk)

# GameProps
TARGET_PRODUCT_PROP += vendor/extra/gameprops/gameprops.prop

# LMOFreeform
PRODUCT_PACKAGES += \
    LMOFreeform \
    LMOFreeformSidebar \
    Datura


# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay/common
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/extra/overlay/common/packages/apps/Launcher3
