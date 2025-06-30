#!/data/data/com.termux/files/usr/bin/bash

CONFIG_URL="https://drive.google.com/uc?export=download&id=1EuVW_nECrltFYLkqE7cY1Z8pAK9lo8UW"
DEST_PATH="/storage/emulated/0/Download/config.txt"

clear
echo -e "\e[34m"
echo "_   _______ _____ _____  _____  _____  _____"
echo "| \\ | |  _  \\_   _/ __  \\|  _  ||  _  |/ __  \\"
echo "|  \\| | | | | | | \`' / /'| |/' || |/' |\`' / /'"
echo "| . \` | | | | | |   / /  |  /| ||  /| |  / /  "
echo "| |\\  | |/ /  | | ./ /___\\ |_/ /\\ |_/ /./ /___"
echo "\\_| \\_/___/   \\_/ \\_____/ \\___/  \\___/ \\_____/"
echo -e "\e[0m"
echo
echo "Tool get config gag , roblox clone danh cho cac cay thue's legit 100% "
echo
echo "[1] config gag onnii ( dang fix )"
echo "[2] tab status ( qly nhieu tab skibidi )"
echo "[3] auto rejoin + auto start"
echo "[4] quit"
echo

read -p "Nhap lua chon: " choice

if [ "$choice" == "1" ]; then
    echo "dang tai config..."
    curl -L -o "$DEST_PATH" "$CONFIG_URL"
    if [ $? -eq 0 ]; then
        echo "config has been install => : $DEST_PATH"
    else
        echo "error , kiem tra lai ket noi DI ME cua may lai"
    fi

elif [ "$choice" == "2" ]; then
    echo "dang kiem tra..."
    apps=("roblox" "roblox_clone_1" "roblox_clone_2")
    for name in "${apps[@]}"; do
        if pgrep -f "$name" > /dev/null; then
            echo "$name    | online"
        else
            echo "$name    | down"
        fi
    done

elif [ "$choice" == "3" ]; then
    read -p "job id ( go n neu may ko co job id ): " job
    read -p "map id ( go n neu may ko co map id ): " map

    echo "start roblox..."
    am start --user 0 -n com.roblox.client/com.roblox.client.Activity >/dev/null
    sleep 2

    if [[ "$job" != "n" && "$map" != "n" ]]; then
        echo "dang reconnect vao game chi dinh..."
        am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
    fi

    echo "tab dang dc thong cong boi client SUCCESSFULLY ..."
    while true; do
        if ! pgrep -f "com.roblox.client" > /dev/null; then
            echo "app tat hoac bi kick, dang mo lai..."
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
    echo "lua chon khong hop le"
fi
