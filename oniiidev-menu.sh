#!/data/data/com.termux/files/usr/bin/bash

CONFIG_URL="https://drive.google.com/uc?export=download&id=1EuVW_nECrltFYLkqE7cY1Z8pAK9lo8UW"
DEST_PATH="/storage/emulated/0/Download/config.txt"

clear
echo -e "\e[34m"
echo "         _   _______ _____ _____  _____  _____  _____"
echo "        | \\ | |  _  \\_   _/ __  \\|  _  ||  _  |/ __  \\"
echo "        |  \\| | | | | | | \`' / /'| |/' || |/' |\`' / /'"
echo "        | . \` | | | | | |   / /  |  /| ||  /| |  / /  "
echo "        | |\\  | |/ /  | | ./ /___\\ |_/ /\\ |_/ /./ /___"
echo "        \\_| \\_/___/   \\_/ \\_____/ \\___/  \\___/ \\_____/"
echo -e "\e[0m"
echo
echo "Tool treo kaitun gag cho banini con "
echo
echo "[1] tải config gag"
echo "[2] quan ly tab "
echo "[3] auto rejoin ( beta )"
echo "[4] quit "
echo

read -p "choice : " choice

if [ "$choice" == "1" ]; then
    echo "dang tai config..."
    curl -L -o "$DEST_PATH" "$CONFIG_URL"
    if [ $? -eq 0 ]; then
        echo "config has been install => : $DEST_PATH"
    else
        echo "error , kiem tra lai ket noi"
    fi

elif [ "$choice" == "2" ]; then
    echo "mày có chạy roblox không đấy ?"

    running=false

    top -n 1 | grep -i roblox | grep -v grep | while read -r line; do
        pid=$(echo "$line" | awk '{print $1}')
        cpu=$(echo "$line" | awk '{print $9}')
        name=$(echo "$line" | awk '{print $12}')

        if [[ "$cpu" == "0.0" || "$cpu" == "0" ]]; then
            status="idle/may lag"
        else
            status="online"
        fi

        echo "$name (pid: $pid) | cpu: $cpu% | $status"
        running=true
    done

    if [ "$running" = false ]; then
        echo "THẰNG LOL ĐÉO CHẠY ROBLOX XONG DÙNG FUNC NÀY LÀ SAO ?"
    fi

elif [ "$choice" == "3" ]; then
    read -p "NHẬP JOB ID NẾU MÀY CÓ: " job
    read -p "NHẬP MAP ID NẾU MÀY MUỐN NÓ BỊ CRASH THÌ CÓ THỂ AUTO VÀO LẠI LUÔN NHÉ: " map

    echo "start roblox..."
    am start --user 0 -n com.roblox.client/com.roblox.client.Activity >/dev/null
    sleep 2

    if [[ "$job" != "n" && "$map" != "n" ]]; then
        echo "dang reconnect vao game chi dinh..."
        am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
    fi

    echo "CÁC TAB ĐÃ VÀO VÒNG LAO LÝ !"
    while true; do
        if ! pgrep -f "com.roblox.client" > /dev/null; then
            echo "app tat hoac crash, dang restart..."
            am start --user 0 -n com.roblox.client/com.roblox.client.Activity >/dev/null
            sleep 2
            if [[ "$job" != "n" && "$map" != "n" ]]; then
                am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
            fi
        fi
        sleep 5
    done

elif [ "$choice" == "4" ]; then
    echo "thoat"
    exit 0
else
    echo "NGU"
fi
