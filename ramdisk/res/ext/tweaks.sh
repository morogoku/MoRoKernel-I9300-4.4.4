#!/sbin/busybox sh
#
# Tweaks - by Javilonas
#

BB=/sbin/busybox

# CACHE AUTO CLEAN

echo "3" > /proc/sys/vm/drop_caches

# disable cpuidle log
echo "0" > /sys/module/cpuidle_exynos4/parameters/log_en

# Miscellaneous tweaks
echo "8" > /proc/sys/vm/page-cluster
echo "5" > /proc/sys/vm/laptop_mode

echo "0" > /proc/sys/kernel/randomize_va_space

# Charger Levels
echo "900" > /sys/kernel/charge_levels/charge_level_usb
echo "1200" > /sys/kernel/charge_levels/charge_level_ac
echo "1" > /sys/kernel/charge_levels/ignore_unstable_power
echo "1" > /sys/kernel/charge_levels/ignore_safety_margin

# Turn off debugging for certain modules
echo "0" > /sys/module/wakelock/parameters/debug_mask
echo "0" > /sys/module/userwakelock/parameters/debug_mask
echo "0" > /sys/module/earlysuspend/parameters/debug_mask
echo "0" > /sys/module/alarm/parameters/debug_mask
echo "0" > /sys/module/alarm_dev/parameters/debug_mask
echo "0" > /sys/module/binder/parameters/debug_mask
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "0" > /sys/module/mali/parameters/mali_debug_level
echo "0" > /sys/module/ump/parameters/ump_debug_level
echo "0" > /sys/module/kernel/parameters/initcall_debug
echo "0" > /sys/module/xt_qtaguid/parameters/debug_mask

# Otros Misc tweaks
$BB mount -t debugfs none /sys/kernel/debug
echo NO_NORMALIZED_SLEEPER > /sys/kernel/debug/sched_features
echo NO_GENTLE_FAIR_SLEEPERS > /sys/kernel/debug/sched_features
echo NO_START_DEBIT > /sys/kernel/debug/sched_features
echo NO_WAKEUP_PREEMPT > /sys/kernel/debug/sched_features
echo NEXT_BUDDY > /sys/kernel/debug/sched_features
echo ARCH_POWER > /sys/kernel/debug/sched_features
echo SYNC_WAKEUPS > /sys/kernel/debug/sched_features
echo HRTICK > /sys/kernel/debug/sched_features

