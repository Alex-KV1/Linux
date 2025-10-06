#!/bin/bash

# Коды ответа
# 200 - OK
# 201 - Created
# 400 - Bad request
# 401 - Unauthorized
# 403 - Forbidden
# 404 - Not found
# 500 - Internal server error
# 501 - Not implemented
# 502 - Bad gateway
# 503 - Service unvailable

CODE_ANS=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
METHOD=("GET" "POST" "PUT" "PATCH" "DELETE")
AGENT=("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0"
    "Mozilla/5.0 (Linux; Android 10; Pixel 3 XL Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36"
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
    "Mozilla/5.0 (Linux; Android 11; SM-G991B Build/RP1A.200720.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15"
    "Mozilla/5.0 (Linux; Android 9; SM-J600G Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36"
    "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:78.0) Gecko/20100101 Firefox/78.0"
    "Mozilla/5.0 (Linux; Android 8.1.0; Nokia 6.1 Build/O11019) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 11; OnePlus 8T Build/RKQ1.201112.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36")


gen_url() {
    local urls=(
        "./gen.sh yand $(($RANDOM % 100 + 1))"
        "./gen.sh pic $(($RANDOM % 100 + 1)).png"
        "./gen.sh home $(($RANDOM % 100 + 1)).ico"
        "./gen.sh google $(($RANDOM % 100 + 1))"
        ""
    )
    echo "${urls[$1]}"
}

gen_data() {
    local months=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
    local day=$((RANDOM % 31 + 1))
    local month=${months[$1]}
    
    if [[ "$month" == "Feb" ]]; then
        day=$((RANDOM % 28 + 1))  # Февраль
    elif [[ "$month" == "Apr" || "$month" == "Jun" || "$month" == "Sep" || "$month" == "Nov" ]]; then
        day=$((RANDOM % 30 + 1))  
    fi
    
    echo "$day/$month/"
}


for (( i=1; i<=5; i++ )); do
    file_name="access$i.log"
    touch "$file_name"
    amount_line=$((RANDOM % 1000 + 1))
    declare -A DATA_HIS
    count=0
    for (( j=0; j<amount_line; j++ )); do
        while :; do
            month=$((RANDOM % 12))
            data="[$(gen_data $month)$(date "+%Y:%T %z")]"
            if [[ -z "${DATA_HIS[$data]}" ]]; then
                DATA_HIS[$data]=1
                break
            fi
        done
        
        # Генерация IP, кода ответа, метода, URL и User-Agent
        ip="$(($RANDOM % 256)).$(($RANDOM % 256)).$(($RANDOM % 256)).$(($RANDOM % 256))"
        code=${CODE_ANS[$((RANDOM % ${#CODE_ANS[@]}))]}
        method=${METHOD[$((RANDOM % ${#METHOD[@]}))]}
        url="/$(gen_url $((RANDOM % 5))) HTTP/1.1"
        agent=${AGENT[$((RANDOM % ${#AGENT[@]}))]}

        # Запись в лог-файл
        printf "%s - - %s \"%s %s\" %s \"%s\"\n" "$ip" "$data" "$method" "$url" "$code" "$agent" >> "$file_name"
    done
done

