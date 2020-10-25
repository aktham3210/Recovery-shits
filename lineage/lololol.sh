#/!bin/bash
telegram -M "Started building Galaxy A30 lineage recovery ♻️"
SYNC_START=$(date +"%s")
cd lineage
. build/envsetup.sh
lunch lineage_a30-userdebug
mka recoveryimage -j8
SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
if [ -f "lineage/out/target/product/a30/recovery.img" ]; then
   telegram -M "build has been completed ✅! done in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
   telegram -f "lineage/out/target/product/a30/recovery.img" "[galaxy A30 Lineage recovery] UNOFFICIAL"
else
   telegram -M "build failed❌ took $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"
fi
