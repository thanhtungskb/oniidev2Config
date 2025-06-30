#!/data/data/com.termux/files/usr/bin/bash

CONFIG_URL="https://drive.google.com/uc?export=download&id=1EuVW_nECrltFYLkqE7cY1Z8pAK9lo8UW"
DEST_PATH="/storage/emulated/0/Download/config.txt"

while true; do
clear

# 🌈 LOGO ONNII với gradient y như ảnh bạn gửi
echo -e "\e[38;5;196m   ██████╗  ███╗   ██╗███╗   ██╗██╗   \e[38;5;202m ███╗  ██╗\e[38;5;208m██╗   \e[38;5;214m██╗██╗\e[38;5;220m██╗"
echo -e "\e[38;5;202m  ██╔═══██╗████╗  ██║████╗  ██║██║   \e[38;5;208m████╗ ██║\e[38;5;214m██║   \e[38;5;220m██║██║\e[38;5;226m██║"
echo -e "\e[38;5;208m  ██║   ██║██╔██╗ ██║██╔██╗ ██║██║   \e[38;5;214m██╔██╗██║\e[38;5;220m██║   \e[38;5;226m██║██║\e[38;5;190m██║"
echo -e "\e[38;5;214m  ██║   ██║██║╚██╗██║██║╚██╗██║██║   \e[38;5;220m██║╚████║\e[38;5;226m██║   \e[38;5;190m██║██║\e[38;5;154m██║"
echo -e "\e[38;5;220m  ╚██████╔╝██║ ╚████║██║ ╚████║█████╗\e[38;5;226m██║ ╚███║\e[38;5;190m╚█████╗██║╚██████╔╝"
echo -e "\e[38;5;226m   ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚════╝\e[38;5;190m╚═╝  ╚══╝\e[38;5;154m ╚════╝╚═╝ ╚═════╝ \e[0m"


# 📋 MENU chính
echo -e "\e[34m╔═════════════════════════════════════════════════════════════╗"
echo    "║                    🌟 ONIIDEV MENU CONSOLE 🌟               ║"
echo    "╠══════════╦══════════════════════════════════════════════════╣"
echo    "║   [1]    ║   tải config gag → tải file config từ link        ║"
echo    "╠══════════╬══════════════════════════════════════════════════╣"
echo    "║   [2]    ║   quản lý tab → quét tiến trình roblox + CPU      ║"
echo    "╠══════════╬══════════════════════════════════════════════════╣"
echo    "║   [3]    ║   auto rejoin (beta) → auto mở lại nếu crash      ║"
echo    "╠══════════╬══════════════════════════════════════════════════╣"
echo    "║   [4]    ║   quit → thoát khỏi chương trình                   ║"
echo -e "╚══════════╩══════════════════════════════════════════════════╝\e[0m"
echo

read -p "CHOICE: " choice

if [ "$choice" == "1" ]; then
    echo "▶ Đang tải file config..."
    curl -L -o "$DEST_PATH" "$CONFIG_URL"
    if [ $? -eq 0 ]; then
        echo "✅ File đã lưu tại: $DEST_PATH"
    else
        echo "❌ Lỗi tải file, kiểm tra kết nối!"
    fi
    read -p "Bấm Enter để quay lại menu..."

elif [ "$choice" == "2" ]; then
    echo "▶ Đang quét tiến trình Roblox..."
    found=false
    ps -A | grep -i roblox | grep -v grep | while read -r line; do
        pid=$(echo "$line" | awk '{print $1}')
        name=$(echo "$line" | awk '{print $NF}')
        cpu=$(top -n 1 | grep "$pid" | awk '{print $9}')
        [ -z "$cpu" ] && cpu="?"
        status="❌ idle/lag"
        [[ "$cpu" != "0" && "$cpu" != "0.0" && "$cpu" != "?" ]] && status="✅ online"
        echo "$name (pid: $pid) | CPU: $cpu% | $status"
        found=true
    done
    if [ "$found" = false ]; then
        echo "🤖 Không phát hiện tiến trình Roblox"
    fi
    read -p "Bấm Enter để quay lại menu..."

elif [ "$choice" == "3" ]; then
    read -p "💡 Nhập JOB ID (hoặc 'n'): " job
    read -p "💡 Nhập MAP ID (hoặc 'n'): " map

    echo "▶ Khởi động Roblox..."
    am start --user 0 -n com.roblox.client/com.roblox.client.Activity >/dev/null
    sleep 2

    if [[ "$job" != "n" && "$map" != "n" ]]; then
        echo "🔄 Đang chuyển tới server chỉ định..."
        am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
    fi

    echo "🛡 Auto rejoin đang chạy..."
    while true; do
        if ! pgrep -f "com.roblox.client" > /dev/null; then
            echo "⚠ App crash — đang mở lại..."
            am start --user 0 -n com.roblox.client/com.roblox.client.Activity >/dev/null
            sleep 2
            if [[ "$job" != "n" && "$map" != "n" ]]; then
                am start -a android.intent.action.VIEW -d "roblox://placeID=$map&jobID=$job"
            fi
        fi
        sleep 5
    done

elif [ "$choice" == "4" ]; then
    echo "👋 Tạm biệt!"
    exit 0

else
    echo "❗ Lựa chọn không hợp lệ"
    read -p "Bấm Enter để quay lại menu..."
fi
done
