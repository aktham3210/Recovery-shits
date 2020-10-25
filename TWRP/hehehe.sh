#!/bin/bash
export TELEGRAM_DISABLE_WEB_PAGE_PREVIEW=true
export DISABLE_WEB_PAGE_PREVIEW=true

telegram -M "starting process! TWRP recovery for the galaxy A30 ♻️"
SYNC_START=$(date +"%s")

mkdir TWRP && cd TWRP
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
repo sync  --force-sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc --all)
git clone --depth 1 https://github.com/crazo7924/twrp_device_samsung_a30 device/samsung/a30

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP recovery synced successfully! done in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
