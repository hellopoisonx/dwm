#!/usr/bin/zsh
#unction get_bytes {
#	interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
#	line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
#	received_bytes=$(awk -F '[= ]' '{printf $2}' $line)
#	transmitted_bytes=$(awk -F '[= ]' '{printf $4}' $line)
#	eval $line
#	now=$(date +%s%N)
#
#unction get_velocity {
#	value=$1
#	old_value=$2
#	now=$3
#
#	timediff=$(($now - $old_time))
#	velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
#	if test "$velKB" -gt 1024
#	then
#		echo $(echo "scale=2; $velKB/1024" | bc)MB/s
#	else
#		echo ${velKB}KB/s
#	fi
#}
RATE=0
while ((1)) {
    DA=$(date '+%m.%d %H:%M')
    SEP=" "
    MEMFREE=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
    VOL=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')
    NET=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    RA=$((`expr $(cat /proc/net/dev | grep wlp3s0 | awk   '{printf $2}')` - $RATE))
    RATE=`expr $(cat /proc/net/dev | grep wlp3s0 | awk   '{printf $2}')`
    SP=$((RA / 1024))
    sp=$(($SP / 1024))
    if ((SP < 1024)) {
	   xsetroot -name "${DA}${SEP}󰻠 ${CPU_USAGE}%${SEP}󰍛 ${MEMFREE}MB${SEP} ${VOL}${SEP}${SP}KB/s"
} else {
	   xsetroot -name "${DA}${SEP}󰻠 ${CPU_USAGE}%${SEP}󰍛 ${MEMFREE}MB${SEP} ${VOL}${SEP}${sp}MB/s"
}
      
    
#    if [[ "$NET" == ""]] {
#	   NET=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
#    get_bytes
#    old_received_bytes=$received_bytes
#    old_transmitted_bytes=$transmitted_bytes
#    old_time=$now
#    get_bytes
#    vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
#    vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)
#    xsetroot -name " ${DA}${SEP}${CPU_USAGE}${SEP}${MEMFREE}MB${SEP} ${VOL}${SEP}${NET}${SEP}${sp}"
    sleep 1s
}
