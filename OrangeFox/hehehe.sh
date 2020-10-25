#!/bin/bash
export TELEGRAM_DISABLE_WEB_PAGE_PREVIEW=true
export DISABLE_WEB_PAGE_PREVIEW=true

telegram -M "starting process! OrangeFOX recovery for the galaxy A30 ♻️"
SYNC_START=$(date +"%s")

mkdir ofox && cd ofox
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_9.0 --depth=1 --groups=all,-notdefault,-device,-darwin,-x86,-mips
repo sync  --force-sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc --all)
git clone https://github.com/YuMi-Project/android_device_samsung_a30 --depth=1 --single-branch device/samsung/a30

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP recovery synced successfully! done in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
