#!/bin/bash

# Цвет фона
BG_BLA='\033[40m'     #  ${BGBLACK}
BG_RD='\033[41m'       #  ${BGRED}
BG_GRE='\033[42m'     #  ${BGGREEN}
BG_BR='\033[43m'     #  ${BGBROWN}
BG_BL='\033[44m'     #  ${BGBLUE}
BG_MAG='\033[45m'     #  ${BGMAGENTA}
BG_CY='\033[46m'     #  ${BGCYAN}
BG_GR='\033[47m'     #  ${BGGRAY}
BG_DEF='\033[49m'      #  ${BGDEF}

# Цвет текста:
BLACK='\033[0;30m'     #  ${BLACK}    # чёрный цвет знаков
RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
GR='\033[0;32m'     #  ${GREEN}    # зелёный цвет знаков
YEL='\033[0;33m'     #  ${YELLOW}    # желтый цвет знаков
BL='\033[0;34m'       #  ${BLUE}      # синий цвет знаков
MAG='\033[0;35m'     #  ${MAGENTA}    # фиолетовый цвет знаков
CYAN='\033[0;36m'       #  ${CYAN}      # цвет морской волны знаков
GRAY='\033[0;37m'       #  ${GRAY}      # серый цвет знаков

NORMAL='\033[0m'

pr1=$1
pr2=$2
pr3=$3
pr4=$4

if [[ -n $pr1 && $pr1 =~ ^[0-9]+$ && 
	  -n $pr2 && $pr2 =~ ^[0-9]+$ && 
	  -n $pr3 && $pr3 =~ ^[0-9]+$ && 
	  -n $pr4 && $pr4 =~ ^[0-9]+$ ]]; then
	if [[ $pr1 = $pr2 || $pr3 = $pr4 ]]; then
		echo "Параметр цвета и фона не должны совпадать"
		echo "Желаешь повторить? Нажми y"
		read -n 1 answ
		if [ $answ = 'y' ]; then
		echo "Введи через пробел параметры (1 2 3 4)"
			read -n 7 str
			./main.sh $str
		fi
		exit 1
	else
		case $pr1 in
			1)	pr1='\033[107m';;
			2)  pr1=$BG_RD;;
			3) 	pr1=$BG_GRE;;
			4)	pr1=$BG_BL;;
			5)	pr1=$BG_MAG;;
			6)	pr1=$BG_BLA;;
			*)  echo "Неверный ввод для pr1. Допустимые значения: 1-6."
				exit 1;;
			esac
			case $pr2 in
			1)	pr2='\033[97m';;
			2) 	pr2=$RED;;
			3)	pr2=$GR;;
			4)	pr2=$BL;;
			5)	pr2=$MAG;;
			6)	pr2=$BLACK;;
			*)  echo "Неверный ввод для pr1. Допустимые значения: 1-6."
				exit 1;;
			esac
			case $pr3 in
			1)	pr3='\033[107m';;
			2) 	pr3=$BG_RD;;
			3)	pr3=$BG_GRE;;
			4)	pr3=$BG_BL;;
			5)	pr3=$BG_MAG;;
			6)	pr3=$BG_BLA;;
			*)  echo "Неверный ввод для pr1. Допустимые значения: 1-6."
				exit 1;;
			esac
			case $pr4 in
			1)	pr4='\033[97m';;
			2) 	pr4=$RED;;
			3)	pr4=$GR;;
			4)	pr4=$BL;;
			5)	pr4=$MAG;;
			6)	pr4=$BLACK;;
			*)  echo "Неверный ввод для pr1. Допустимые значения: 1-6."
				exit 1;;
			esac
		fi
else
    echo "Должно быть введено 4 параметра "
    exit 1
fi

#if [[ $pr = [A..Z] ||  ]]; then
#	echo "Не указан параметр"

#elif [[ ! $param =~ ^[0-9]+$ && -n $param ]]; then
#	echo "Введен параметр: $param"
#else
#	echo "Введен неверный параметр"
#fi


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

echo -e "$pr2$pr1**HOSTNAME**        = $pr4$pr3$host_n            $NORMAL"
echo -e "$pr2$pr1**TIMEZONE**        = $pr4$pr3$timezone              $NORMAL"
echo -e "$pr2$pr1**USER**            = $pr4$pr3$user                  $NORMAL"
echo -e "$pr2$pr1**OS**              = $pr4$pr3$os                    $NORMAL"
echo -e "$pr2$pr1**DATE**            = $pr4$pr3$data                  $NORMAL"
echo -e "$pr2$pr1**UPTIME**          = $pr4$pr3$up_t                  $NORMAL"
echo -e "$pr2$pr1**UPTIME_SEC**      = $pr4$pr3$up_t_in_sec           $NORMAL"
echo -e "$pr2$pr1**IP**              = $pr4$pr3$ip                    $NORMAL"
echo -e "$pr2$pr1**MASK**            = $pr4$pr3$mask                  $NORMAL"
echo -e "$pr2$pr1**GATEWAY**         = $pr4$pr3$GATEWAY               $NORMAL"
echo -e "$pr2$pr1**RAM_TOTAL**       = $pr4$pr3$ram_totall,$ram_total        $NORMAL"
echo -e "$pr2$pr1**RAM_USED**        = $pr4$pr3$ram_used              $NORMAL"
echo -e "$pr2$pr1**RAM_FREE**        = $pr4$pr3$ram_free              $NORMAL"
echo -e "$pr2$pr1**SPACE_ROOT**      = $pr4$pr3$space_root            $NORMAL"
echo -e "$pr2$pr1**SPACE_ROOT_USED** = $pr4$pr3$sp_root_used          $NORMAL"
echo -e "$pr2$pr1**SPACE_ROOT_FREE** = $pr4$pr3$SPACE_ROOT_FREE       $NORMAL"
