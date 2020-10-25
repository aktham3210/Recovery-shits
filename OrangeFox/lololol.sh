#/!bin/bash
telegram -M "Started building Galaxy A30 OrangeFOX recovery ♻️"
SYNC_START=$(date +"%s")
cd ofox
. build/envsetup.sh
lunch omni_a30-eng
mka recoveryimage -j8
SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
if [ -f "ofox/out/target/product/a30/recovery.img ]; then
   telegram -M "build has been completed ✅! done in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
   telegram -f "ofox/out/target/product/a30/recovery.img" "[galaxy A30 Lineage recovery] UNOFFICIAL"
else
   telegram -M "build failed❌ took $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
