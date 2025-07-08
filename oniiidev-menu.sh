#!/data/data/com.termux/files/usr/bin/bash
required_pkgs=("curl" "termux-api" "awk" "grep")

echo "Checking Termux environment..."

for pkg in "${required_pkgs[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        echo "Missing: $pkg → installing..."
        pkg install "$pkg" -y
    else
        echo "Found: $pkg"
    fi
done

# Check for storage access
if [ ! -d "/storage/emulated/0" ]; then
    echo "Requesting storage permissions..."
    termux-setup-storage
    sleep 1
fi

clear

VALID_KEY="9f1WLGREWruRzOcuox3se88QjauzEsOd8OQOOqrDbVWcDreEcEeBADmDitxq0CYilVxhjaY73XCsCPXE1dO2yg0mU7e5DYuztf6iCsmwT9kIzOXHW3t9X5SeqbXMefrACBRgP5sbQO1xFyRei6HojeeTVadEzFfAakx3xvG5GYXJBCDGyQ9vopLVDFRrzZQjsdXeASJmrYEZ6cS3PifZ3pboihTeHLH2fi2KG00KmQYM4Fv4Gp1fMd1gvwOxvGSwPDb0YZM7pcgMR2wR1ELYIo5DV40OubPFm3y6B3wkk3ievOwKy1ob8pJdRDLYzKUKpGKSiYVCVD5ZBrSVmY9UzTmurgQDHCDhX3vM8EIKU3ecWjK7MLgQ2ielh5DZMmHZpKtUJwWKeBSzuas4ZJtiGp2vEGO6vMeLhUwwi4mRDxeIxtoUujYaycTcv"

CONFIG_URL="https://drive.google.com/uc?export=download&id=1EuVW_nECrltFYLkqE7cY1Z8pAK9lo8UW"
DEST_PATH="/storage/emulated/0/Download/config.txt"
GETKEY_URL="https://workink.net/21px/mcu0n0uh"  

clear
echo -e "\e[38;5;196m   ██████╗  ███╗   ██╗███╗  ██╗██╗ \e[38;5;202m  ███╗  ██╗\e[38;5;208m██╗   \e[38;5;214m██╗██╗\e[38;5;220m██╗"
echo -e "\e[38;5;202m  ██╔═══██╗████╗  ██║████╗  ██║██║   \e[38;5;208m████╗ ██║\e[38;5;214m██║   \e[38;5;220m██║██║\e[38;5;226m██║"
echo -e "\e[38;5;208m  ██║   ██║██╔██╗ ██║██╔██╗ ██║██║   \e[38;5;214m██╔██╗██║\e[38;5;220m██║   \e[38;5;226m██║██║\e[38;5;190m██║"
echo -e "\e[38;5;214m  ██║   ██║██║╚██╗██║██║╚██╗██║██║   \e[38;5;220m██║╚████║\e[38;5;226m██║   \e[38;5;190m██║██║\e[38;5;154m██║"
echo -e "\e[38;5;220m  ╚██████╔╝██║ ╚████║██║ ╚████║█████╗\e[38;5;226m██║ ╚███║\e[38;5;190m╚█████╗██║╚██████╔╝"
echo -e "\e[38;5;226m   ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚════╝\e[38;5;190m╚═╝  ╚══╝\e[38;5;154m ╚════╝╚═╝ ╚═════╝ \e[0m"
echo
echo -e "\e[36m get \e[0m"
echo -e " Link get key : \e[4;34m$GETKEY_URL\e[0m"
echo "Tool requires key access"
echo "→ Get your key here: $GETKEY_URL"
read -p "→ Enter your key: " input_key

if [[ "$input_key" == "$VALID_KEY" ]]; then
    echo -e "\nCorrect key, loading tool..."
    sleep 1.5
    clear
else
    echo -e "\nInvalid key. Please check and try again."
    exit 1
fi

echo -e "\e[34m╔═════════════════════════════════════════════════════════════╗"
echo    "║  tool roblox - bản 0.4.1 | dev bởi thanh tung STATUS : WORKING    ║"
echo    "╠══════════╦════════════════════════════════════════════════════════╣"
echo    "║   [1]    ║   tải config gag                                       ║"
echo    "╠══════════╬════════════════════════════════════════════════════════╣"
echo    "║   [2]    ║   roblox tab manager skibidi                           ║"
echo    "╠══════════╬════════════════════════════════════════════════════════╣"
echo    "║   [3]    ║   auto rejoin (beta dev)                               ║"
echo    "╠══════════╬════════════════════════════════════════════════════════╣"
echo    "║   [4]    ║   thoát                                                ║"
echo -e "╚══════════╩════════════════════════════════════════════════════════╝\e[0m"
echo

read -p "CHOICE: " choice

if [ "$choice" == "1" ]; then
    echo "▶ Đang tải file config..."
    curl -L -o "$DEST_PATH" "$CONFIG_URL"
    if [ $? -eq 0 ]; then
        echo "config has been instal =>: $DEST_PATH"
    else
        echo "wifi quá ngu"
    fi
    read -p "enter để về lại menu cặc"

elif [ "$choice" == "2" ]; then
    echo
    echo "Đã cập nhật hỗ trợ cho giả lập !"
    echo

    found=false
    printf "\e[36m╔════════════╦══════════════╦════════════╦════════════════════╗\n"
    printf "║   PID      ║   Process    ║   CPU (%%)  ║     Status         ║\n"
    printf "╠════════════╬══════════════╬════════════╬════════════════════╣\e[0m\n"

    targets=("com.roblox.client" "roblox" "roblox_clone_1" "robloxmod" "HD-Player" "ldplayer" "dnplayer" "nox" "MEmuHeadless" "LDBOXHeadless")

for name in "${targets[@]}"; do
    ps -A | grep -i "$name" | grep -v grep | while read -r line; do
        pid=$(echo "$line" | awk '{print $2}')
        name_display=$(echo "$line" | awk '{print $NF}')
        cpu=$(top -n 1 | grep "$pid" | awk '{print $9}')
        [[ -z "$cpu" ]] && cpu="?"
        status="⚠️ idle"
        [[ "$cpu" != "0" && "$cpu" != "0.0" && "$cpu" != "?" ]] && status="✅ đang chạy"
        printf "║ %-10s ║ %-12s ║ %-10s ║ %-18s ║\n" "$pid" "$name_display" "$cpu" "$status"
        found=true
    done
done


    printf "\e[36m╚════════════╩══════════════╩════════════╩════════════════════╝\e[0m\n"
    echo

    if [ "$found" = false ]; then
        echo -e "\n lỗi tại bạn , không phải tôi"
    fi

    read -p "enter để quay lại menu cặc"


elif [ "$choice" == "3" ]; then
    read -p "job id: " job
    read -p "map id: " map

    echo "đang mở roblox cho óc cặc ..."

    if [[ "$job" == "n" || "$map" == "n" ]]; then
        am start -a android.intent.action.VIEW -d "roblox://"
    else
        am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
    fi

    sleep 10  # Chờ Roblox khởi động xong (tránh mở lại quá sớm)

    echo "auto rejoin : live"
    while true; do
        if ! pidof com.roblox.client > /dev/null; then
            echo "máy quá yếu ... đang gọi hồn dậy lại !"

            if [[ "$job" == "n" || "$map" == "n" ]]; then
                am start -a android.intent.action.VIEW -d "roblox://"
            else
                am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
            fi

            sleep 10  # Thêm delay sau khi rejoin
        fi
        sleep 5
    done


elif [ "$choice" == "4" ]; then
    echo "cút !"
    exit 0

else
    echo "ngu"
    read -p "enter để quay lại tab cặc"
fi
done
