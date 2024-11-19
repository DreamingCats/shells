#!/bin/bash

# 批量调起sql

# Changelog
# 20240912 Create

env=dev  # Set run environment Option:dev/prd
db=postgres #postgres/mysql
sql_timeout=300s # Set timeout
sql_dir=./ # Set dir

# Set color
green_begin='\033[32m'
red_begin='\033[31m'
yellow_begin='\033[33m'
blue_begin='\033[38;2;102;204;255m' # RGB #66ccff
color_end='\033[0m'

# Run sql
sum_sql=$(find "${sql_dir}" -maxdepth 1 -type f | wc -l) # 更换为 find 命令，避免特殊文件名问题
cnt=0 #counter

# 使用 while 循环替代 for 遍历，防止文件名包含特殊字符出错
find "${sql_dir}" -maxdepth 1 -type f | while read -r sql; do
    cnt=$((cnt + 1))
    echo -e "${blue_begin}[$(date +"%H:%M:%S")] 第${cnt}个,共${sum_sql}个,正在执行${sql}${color_end}"
    start_time=$(date +"%s") #%s时间戳
    if [ db = "postgres" ]
    then
        $(psql -h localhost -p 5432 -d postgres -U postgres -W your_password )
    elif [ db = "mysql" ]
    then

    fi
done

# Prevent from logout
echo -e "本次操作执行完成!已自动执行cat防止掉线,使用Ctrl+C退出shell"
cat /dev/null
exit 1
