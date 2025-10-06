#!/bin/bash

if ! command -v route; then
	sudo apt-get update
	sudo apt install net-tools
fi

host_n=$(hostname)
#dat="$(timedatectl | grep Time | sed  -e 's/^[ \t]*//') $(date)"
timezone=$(timedatectl | grep Time | sed  -e 's/^[ \t]*//')
user=$(whoami)
os=$(hostnamectl | grep "Operating System" | sed -e 's/Operating System://; s/^[ \t]*//')
data=$(date +'%d %b %Y %H:%M:%S')
up_t=$(uptime -p | sed 's/up //')
up_t_in_sec=$(cat /proc/uptime | sed 's/\..*//')
ip=$(ip address | grep inet | grep global | head -1 | sed 's/ [ a-z]*//' | sed 's/\/.*//')
let ram_total=$(free | grep Mem | sed 's/^Mem: *[^0-9]*//' | sed 's/ .*//')
let ram_totall=ram_total/1024
let ram_total=ram_total%1024
let r=$(free | grep Mem | sed 's/^Mem: *[0-9]* *//' |sed 's/ .*//')/1024 
let a=$(free | grep Mem | sed 's/^Mem: *[0-9]* *//' |sed 's/ .*//')%1024
ram_used="$r,$a"

let r=$(free | grep Mem | sed 's/Mem: *[0-9]* *[0-9]* *//;s/ .*//')/1024 
let a=$(free | grep Mem | sed 's/Mem: *[0-9]* *[0-9]* *//;s/ .*//')%1024
ram_free="$r,$a"
let r=$(df | grep '/$' | sed 's/[^0-9]*//; s/ .*//')/1024
let a=$(df | grep '/$' | sed 's/[^0-9]*//; s/ .*//')%1024/10
space_root="$r,$a"
sp_root_used=$(df | awk '/\/$/'{'printf "%0.2f", $3 / 1024'})
SPACE_ROOT_FREE=$(df | awk '/\/$/'{'printf "%0.2f", $4 / 1024'})
ip_cut=$(echo "$ip" | sed 's/\..*//')
mask=$(route -n | awk -v m=$ip_cut '$0 ~ m {print $3}' | head -1)
GATEWAY=$(route -n | awk -v m=$ip_cut '$0 ~ m {print $2}' | head -1)

echo "**HOSTNAME** = $host_n"
echo "**TIMEZONE** = $timezone"
echo "**USER** = $user"
echo "**OS** = $os"
echo "**DATE** = $data"
echo "**UPTIME** = $up_t"
echo "**UPTIME_SEC** = $up_t_in_sec"
echo "**IP** = $ip"
echo "**MASK** = $mask"
echo "**GATEWAY** = $GATEWAY"
echo "**RAM_TOTAL** = $ram_totall,$ram_total"
echo "**RAM_USED** = $ram_used"
echo "**RAM_FREE** = $ram_free"
echo "**SPACE_ROOT** = $space_root"
echo "**SPACE_ROOT_USED** = $sp_root_used"
echo "**SPACE_ROOT_FREE** = $SPACE_ROOT_FREE"

echo "Если хочещь сохранить данные ввдеи \"Y\" | \"y\""

read -n 1 enter
if [[ $enter == 'Y' || $enter == 'y' ]]; then
	name=$(date +'%d_%m_%Y_%H_%M_%S').status.txt
	touch $name
	echo "********************************">>$name
	echo "**HOSTNAME** = $host_n" >>$name
	echo "**TIMEZONE** = $timezone">>$name
	echo "**USER** = $user">>$name
	echo "**OS** = $os">>$name
	echo "**DATE** = $data">>$name
	echo "**UPTIME** = $up_t">>$name
	echo "**UPTIME_SEC** = $up_t_in_sec">>$name
	echo "**IP** = $ip">>$name
	echo "**MASK** = $mask">>$name
	echo "**GATEWAY** = $GATEWAY">>$name
	echo "**RAM_TOTAL** = $ram_totall,$ram_total">>$name
	echo "**RAM_USED** = $ram_used">>$name
	echo "**RAM_FREE** = $ram_free">>$name
	echo "**SPACE_ROOT** = $space_root">>$name
	echo "**SPACE_ROOT_USED** = $sp_root_used">>$name
	echo "**SPACE_ROOT_FREE** = $SPACE_ROOT_FREE">>$name
	echo "********************************">>$name
fi