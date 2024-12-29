#!/bin/bash

# 临时文件路径，用于存储prev_up和prev_down
STATE_FILE="/tmp/traffic_state"

# 获取网络接口的上传和下载字节数
net_data=$(grep 'wlp3s0' /proc/net/dev | awk '{print $2, $10}')
IFS=' ' read -r down up <<< "$net_data"

# 从文件中读取上次的上传和下载字节数
if [ -f "$STATE_FILE" ]; then
    source "$STATE_FILE"
else
    # 如果文件不存在，初始化prev_up和prev_down为当前值
    prev_up=$up
    prev_down=$down
fi

# 计算上传和下载字节数的差值（即上传和下载速度）
upload_speed=$((up - prev_up))
download_speed=$((down - prev_down))

# 更新上次的上传和下载字节数
export prev_up=$up
export prev_down=$down

# 将prev_up和prev_down保存到文件中
echo "prev_up=$prev_up" > "$STATE_FILE"
echo "prev_down=$prev_down" >> "$STATE_FILE"

# 将字节数转换为可读的格式
to_human_readable() {
    t=$1
    units=("B" "KB" "MB" "GB")
    count=0
    while [ "$t" -ge 1024 ] && [ $count -lt 3 ]; do
        t=$((t / 1024))
        count=$((count + 1))
    done
    echo "$t ${units[$count]}/s"
}

# 调用转换函数并输出结果
_up=$(to_human_readable "$upload_speed")
_down=$(to_human_readable "$download_speed")

# 显示上传和下载速度
echo ":$_up :$_down"

# 如果需要持续运行脚本，可以取消注释以下部分
# while true; do
#     sleep 1
#     ./traffic.sh
# done
