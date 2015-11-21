#!/sbin/busybox sh
#
# Script inicio MTweaks
#

BB=/sbin/busybox
PROFILE_PATH=/data/.mtweaks

if [ ! -d $PROFILE_PATH/bk ] ; then
	$BB mkdir $PROFILE_PATH/bk
	$BB chmod 0777 $PROFILE_PATH/bk
	$BB chown 0.0 $PROFILE_PATH/bk
fi


# Save original voltages
$BB cat /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table > $PROFILE_PATH/bk/bk_orig_cpu_voltage
$BB cat /sys/devices/virtual/misc/gpu_clock_control/gpu_control > $PROFILE_PATH/bk/bk_orig_gpu_clock
$BB cat /sys/devices/virtual/misc/gpu_voltage_control/gpu_control > $PROFILE_PATH/bk/bk_orig_gpu_voltage
$BB cat /sys/devices/system/cpu/busfreq/int_volt_table > $PROFILE_PATH/bk/bk_orig_int_voltage
$BB cat /sys/devices/system/cpu/busfreq/mif_volt_table > $PROFILE_PATH/bk/bk_orig_mif_voltage

$BB chmod -R 755 $PROFILE_PATH/*
$BB chown -R 0.0 $PROFILE_PATH/*


# Copy profiles
if [ ! -f $PROFILE_PATH/battery.profile ] ; then
	$BB cp /res/customconfig/battery.profile $PROFILE_PATH/battery.profile
	$BB chmod 755 $PROFILE_PATH/battery.profile
	$BB chown 0.0 $PROFILE_PATH/battery.profile
fi

if [ ! -f $PROFILE_PATH/performance.profile ] ; then
	$BB cp /res/customconfig/performance.profile $PROFILE_PATH/performance.profile
	$BB chmod 755 $PROFILE_PATH/performance.profile
	$BB chown 0.0 $PROFILE_PATH/performance.profile
fi


# MTweaks support
$BB chmod -R 755 /res/customconfig/*
$BB chown -R 0:0 /res/customconfig/*

$BB rm $PROFILE_PATH/customconfig.xml
$BB rm $PROFILE_PATH/action.cache

$BB chmod 755 /res/uci.sh
$BB chown 0.0 /res/uci.sh

/res/uci.sh apply

$BB sync

