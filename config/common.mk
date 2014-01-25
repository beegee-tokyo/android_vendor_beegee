PRODUCT_BRAND ?= beegee

# bootanimation
#PRODUCT_COPY_FILES += \
#	vendor/beegee/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false \
	persist.sys.root_access=1

# BeeGee properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dataroaming=false \
	persist.sys.root_access=1 \
	ro.HOME_APP_ADJ=1 \
	debug.sf.hw=1 \
	windowsmgr.max_events_per_sec=240 \
	ro.telephony.call_ring.delay=0 \
	wifi.supplicant_scan_interval=180 \
	pm.sleep_mode=1 \
	ro.ril.disable.power.collapse=0 \
	mot.proximity.delay=25 \
	debug.performance.tuning=1 \
	video.accelerate.hw=1 \
	ro.media.enc.jpeg.quality=100 \
	persist.sys.purgeable_assets=1 \
	ro.tether.denied=false \
	ro.secure=0 \
	debug.performance.tuning=1 \
	ro.max.fling_velocity=12000 \
	ro.min.fling_velocity=8000 \
	dalvik.vm.dexopt-flags=m=v,o=y \
	net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960 \
	persist.sys.usb.config=mtp,adb

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/beegee/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/beegee/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/beegee/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/beegee/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/beegee/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/beegee/prebuilt/etc/init.d/91Ganbarou:system/etc/init.d/91Ganbarou \
    vendor/beegee/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with BeeGee extras
PRODUCT_COPY_FILES += \
    vendor/beegee/prebuilt/etc/init.local.rc:root/init.beegee.rc

# BeeGee gps & hosts file
PRODUCT_COPY_FILES += \
    vendor/beegee/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/beegee/prebuilt/etc/gps.conf:system/etc/gps.conf \
    vendor/beegee/prebuilt/etc/hosts:system/etc/hosts

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/beegee/config/packages.mk

# Superuser packages
-include vendor/beegee/config/superuser.mk

# Versioning
-include vendor/beegee/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/beegee/overlay/common
