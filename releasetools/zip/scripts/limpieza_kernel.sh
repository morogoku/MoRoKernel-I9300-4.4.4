#!/sbin/sh
# ====================================
# Script de limpieza para MoRoROM v3.0
# ====================================

# Kernel
rm /data/app/de.andip71.boeffla_config_v2-*.apk
rm /data/app/com.arter97.aswitch-*.apk
rm /data/app/com.arter97.atweaks-*.apk
rm /data/app/com.javilonas.tpowercc.app-*.apk
rm /data/app/com.lonas.remsound-*.apk
rm /system/app/aSwitch.apk
rm /system/app/aTweaks.apk
rm /system/app/XTweaks.apk
rm /system/app/MTweaks.apk
rm /data/app/com.xpure.xtweaks.app-*.apk
rm /system/kernel.ota.prop
rm -Rf /data/data/de.andip71.boeffla_config_v2
rm -Rf /data/data/com.arter97.aswitch
rm -Rf /data/data/com.arter97.atweaks
rm -Rf /data/data/com.javilonas.tpowercc.app
rm -Rf /data/data/com.lonas.remsound
rm -Rf /data/data/com.xpure.xtweaks.app
rm -Rf /data/data/com.morogoku.mtweaks.app

rm -rf /data/.boeffla
rm -rf /data/.tpowercc
rm -rf /data/.arter97
rm -rf /data/.siyah
rm -rf /data/.moro
rm -rf /data/media/.arter97
rm -rf /data/media/0/.arter97

rm -rf /system/etc/init.d
mkdir /system/etc/init.d

rm -rf /data/media/kernel
rm -rf /data/media/0/kernel
rm -rf /data/media/boeffla-kernel-data
rm -rf /data/media/0/boeffla-kernel-data
rm -rf /data/media/AGNi_efs_backup
rm -rf /data/media/0/AGNi_efs_backup
rm /data/media/AGNi_reset_oc-uv_on_boot_failure.zip
rm /data/media/0/AGNi_reset_oc-uv_on_boot_failure.zip
