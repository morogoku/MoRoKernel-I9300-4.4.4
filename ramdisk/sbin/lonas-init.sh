#!/sbin/busybox sh
#
# Script inicio lonas-init.sh
#

BB=/sbin/busybox
PROFILE_PATH=/data/.mtweaks

# Inicio
$BB mount -o remount,rw -t auto /system
$BB mount -o remount,rw -t auto /data
$BB mount -t rootfs -o remount,rw rootfs

# Crear carpeta MTWEAKS si no existe
if [ ! -d $PROFILE_PATH ] ; then
	$BB mkdir $PROFILE_PATH
	$BB chmod 0777 $PROFILE_PATH
	$BB chown 0.0 $PROFILE_PATH
fi

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
$BB mount -o remount,rw -t auto /data
$BB mount -o remount,ro -t auto /system
