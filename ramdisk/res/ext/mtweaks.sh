#!/sbin/busybox sh
#
# Script inicio MTweaks
#

BB=/sbin/busybox

$BB chmod 755 /res/customconfig/actions/chargeaccurrent
$BB chmod 755 /res/customconfig/actions/chargeusbcurrent
$BB chmod 755 /res/customconfig/actions/controlswitch
$BB chmod 755 /res/customconfig/actions/cpugeneric
$BB chmod 755 /res/customconfig/actions/cpuvolt
$BB chmod 755 /res/customconfig/actions/enable_mask
$BB chmod 755 /res/customconfig/actions/eq-custom
$BB chmod 755 /res/customconfig/actions/eqpresets
$BB chmod 755 /res/customconfig/actions/eq-profile
$BB chmod 755 /res/customconfig/actions/generic
$BB chmod 755 /res/customconfig/actions/generic01
$BB chmod 755 /res/customconfig/actions/generictag
$BB chmod 755 /res/customconfig/actions/generictagforce
$BB chmod 755 /res/customconfig/actions/gpufreq
$BB chmod 755 /res/customconfig/actions/gputhreshold
$BB chmod 755 /res/customconfig/actions/gpuvolt
$BB chmod 755 /res/customconfig/actions/gpuvolt2
$BB chmod 755 /res/customconfig/actions/intvolt
$BB chmod 755 /res/customconfig/actions/iosched
$BB chmod 755 /res/customconfig/actions/mdnie
$BB chmod 755 /res/customconfig/actions/mifvolt
$BB chmod 755 /res/customconfig/actions/minfree
$BB chmod 755 /res/customconfig/actions/volume-h
$BB chmod 755 /res/customconfig/actions/volume-s
$BB chmod 755 /res/customconfig/actions/zram

$BB chmod 755 /res/customconfig/customconfig-helper
$BB chmod 755 /res/customconfig/customconfig.xml.generate

$BB rm /data/.moro/customconfig.xml
$BB rm /data/.moro/action.cache


$BB chmod 755 /res/uci.sh
/res/uci.sh apply


