#!/sbin/busybox sh
#
# Script inicio lonas-init.sh
#

BB=/sbin/busybox

# Inicio
$BB mount -o remount,rw -t auto /system
$BB mount -t rootfs -o remount,rw rootfs

# Logfile de kernel boeffla, adaptado por morogoku
# define file paths
	MORO_LOGFILE="/data/.moro/moro-kernel.log"

# maintain log file history
	rm $MORO_LOGFILE.3
	mv $MORO_LOGFILE.2 $MORO_LOGFILE.3
	mv $MORO_LOGFILE.1 $MORO_LOGFILE.2
	mv $MORO_LOGFILE $MORO_LOGFILE.1

# Initialize the log file (chmod to make it readable also via /sdcard link)
	echo $(date) MoRo-Kernel initialisation started > $MORO_LOGFILE
	/sbin/busybox chmod 777 $MORO_LOGFILE
	/sbin/busybox cat /proc/version >> $MORO_LOGFILE
	echo "=========================" >> $MORO_LOGFILE
	/sbin/busybox grep ro.build.version /system/build.prop >> $MORO_LOGFILE
	echo "=========================" >> $MORO_LOGFILE


# Iniciar Liberar Memoria
/res/ext/libera_swap.sh &
$BB renice 19 `pidof libera_swap.sh`

# Detectar y generar INIT.D
/res/ext/init_d.sh

# Iniciar Bootanimation personalizado
/res/ext/bootanimation.sh

# Limpiador
/res/ext/limpiador.sh

# Iniciar SQlite
/res/ext/sqlite.sh

# Iniciar Zipalign
/res/ext/zipalign.sh

# Iniciar Tweaks Lonas_KL
/res/ext/tweaks.sh

# Iniciar Sensor
/res/ext/sensors.sh

# Iniciar MTP/adb
/res/ext/usb_mtp.sh

# Iniciar Init.d
/res/ext/init_d2.sh

# Iniciar MTweaks
/res/ext/mtweaks.sh

$BB sync

$BB mount -t rootfs -o remount,ro rootfs
$BB mount -o remount,ro -t auto /system
