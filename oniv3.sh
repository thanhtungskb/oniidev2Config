#!/data/data/com.termux/files/usr/bin/bash


CONFIG_URL="https://drive.google.com/uc?export=download&id=118fLVGGpv1J6-1BhrN5uBFuqHE51rNwS"
DEST_PATH="/storage/emulated/0/Download/config.txt"


clear
echo " _   _______ _____ _____  _____  _____  _____"
echo "| \\ | |  _  \\_   _/ __  \\|  _  ||  _  |/ __  \\"
echo "|  \\| | | | | | | \`' / /'| |/' || |/' |\`' / /'"
echo "| . \` | | | | | |   / /  |  /| ||  /| |  / /  "
echo "| |\\  | |/ /  | | ./ /___\\ |_/ /\\ |_/ /./ /___"
echo "\\_| \\_/___/   \\_/ \\_____/ \\___/  \\___/ \\_____/"
echo
echo "Developer by oniiidev"
echo
echo "[1] Install config"
echo "- Type 1 for install config"
echo

# Nhập lựa chọn
read -p "Nhập lựa chọn: " choice

if [ "$choice" == "1" ]; then
    echo "📥 Đang tải file config.txt ..."
    curl -L -o "$DEST_PATH" "$CONFIG_URL"

    if [ $? -eq 0 ]; then
        echo "✅ File đã tải thành công về: $DEST_PATH"
    else
        echo "❌ Lỗi tải file. Kiểm tra kết nối hoặc URL!"
    fi
else
    echo "⛔ Lựa chọn không hợp lệ. Gõ số 1 để tải config nha!"
fi
