#!/sbin/busybox sh
#
# libera pagecache y swap cada 20 minutos si esta está por debajo de 204800 kbytes (200MB)
# Script creado por Javilonas
#
# modificado por morogoku

MORO_LOGFILE="/data/.moro/moro-kernel.log"
BB=/sbin/busybox


$BB renice 19 `pidof libera_swap.sh`
DROP_ONE="1"
DROP_TWO="2"
DROP_THREE="3"


while [ 1 ];
do
	FREE=`free -m | grep -i swap | awk '{print $4}'`

        if [ $FREE -lt 204800 ]; then
                $BB sync
                $BB sleep 3
		echo $DROP_ONE > /proc/sys/vm/drop_caches
		echo $DROP_TWO > /proc/sys/vm/drop_caches
		echo $DROP_THREE > /proc/sys/vm/drop_caches
		$BB sync; echo $DROP_THREE > /proc/sys/vm/drop_caches
                $BB sync
		$BB swapoff /dev/block/vnswap0 > /dev/null 2>&1
		$BB swapon -p 2 /dev/block/vnswap0 > /dev/null 2>&1
                $BB sync
		echo $(date) "Swap libre="$FREE", muy bajo, liberando..." >> $MORO_LOGFILE
	else
		echo $(date) "Swap libre="$FREE", tamaño normal" >> $MORO_LOGFILE
        fi
sleep 1200
done



