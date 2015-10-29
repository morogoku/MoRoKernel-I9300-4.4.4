#!/sbin/busybox sh
#
#

# set busybox location
BB=/sbin/busybox

$BB mount -o remount,rw,nosuid,nodev /cache;
$BB mount -o remount,rw,nosuid,nodev /data;
$BB mount -o remount,rw /;
$BB mount -o remount,rw /lib/modules;

# cleaning
$BB rm -rf /cache/lost+found/* 2> /dev/null;
$BB rm -rf /data/lost+found/* 2> /dev/null;
$BB rm -rf /data/tombstones/* 2> /dev/null;
$BB rm -rf /data/anr/* 2> /dev/null;

# critical Permissions fix
$BB chown -R 0:1000 /sys/devices/system/cpu/;
$BB chown -R 1000:1000 /data/anr;
$BB chown -R 0:1001 /data/property/;
$BB chmod -R 777 /tmp/;
$BB chmod -R 6755 /sbin/ext/;
$BB chmod -R 0777 /dev/cpuctl/;
$BB chmod -R 0777 /data/system/inputmethod/;
$BB chmod -R 0777 /sys/devices/system/cpu/;
$BB chmod -R 0777 /data/anr/;
$BB chmod 0744 /proc/cmdline;
$BB chmod -R 0770 /data/property/;
$BB chmod -R 0400 /data/tombstones;

# fix owners on critical folders
$BB chown -R 0:0 /tmp;
$BB chown -R 0:0 /res;
$BB chown -R 0:0 /sbin;
$BB chown -R 0:0 /lib;

# oom and mem perm fix
$BB chmod 666 /sys/module/lowmemorykiller/parameters/cost;
$BB chmod 666 /sys/module/lowmemorykiller/parameters/adj;

# protect init from oom
echo "-1000" > /proc/1/oom_score_adj;

# set sysrq to 2 = enable control of console logging level as with CM-KERNEL
echo "2" > /proc/sys/kernel/sysrq;

# fix storage folder owner
$BB chown system.sdcard_rw /storage;

# Play sound for Remsound compatibility
/sbin/tinyplay /res/misc/silence.wav -D 0 -d 0 -p 880


# Now wait for the rom to finish booting up
# (by checking for any android process)
while ! $BB pgrep android.process.acore ; do
  $BB sleep 2
done

# kill radio logcat to sdcard
$BB pkill -f "logcat -b radio -v time";

sync;

