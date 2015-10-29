#!/sbin/busybox sh
#
# Script inicio MTweaks
#

BB=/sbin/busybox

# Save original voltages
$BB mkdir /data/.moro/bk
$BB chmod 0777 /data/.moro/bk
$BB chown 0.0 /data/.moro/bk

$BB cat /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table > /data/.moro/bk/bk_orig_cpu_voltage
$BB cat /sys/class/misc/gpu_control/gpu_clock_control > /data/.moro/bk/bk_orig_gpu_clock
$BB cat /sys/class/misc/gpu_control/gpu_voltage_control > /data/.moro/bk/bk_orig_gpu_voltage

$BB chmod 755 /data/.moro/bk/*
$BB chown 0.0 /data/.moro/bk/*
	
# MTweaks support
$BB chmod -R 755 /res/customconfig/*
$BB chown -R 0:0 /res/customconfig/*
$BB chmod -R 755 /res/customconfig/actions/*
$BB chown -R 0:0 /res/customconfig/actions/*

$BB rm /data/.moro/customconfig.xml
$BB rm /data/.moro/action.cache

$BB chmod 755 /res/uci.sh
$BB chown 0.0 /res/uci.sh

/res/uci.sh apply

$BB sync

