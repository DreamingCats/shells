#!/bin/bash

# 批量检测代码中是否写了带有日期(一定时间范围内)的Changelog

# Changelog
# 20241101 Create

# Set color
green_begin='\033[32m '
red_begin='\033[31m '
yellow_begin='\033[33m '
blue_begin='\033[38;2;102;204;255m]' # RGB #66ccff
color_end='\033[0m'

codes_dir="./test"

current_date=$(date +%Y%m%d)
begin_date=$(date -d "-30 days" +%Y%m%d)
end_date=$(date -d "+30 days" +%Y%m%d)

cd "$codes_dir" || exit

for codes_file in * ; do
    last_changelog_date=$(grep -Eho '20[0-9]{2}(-?)[0-9]{2}\1[0-9]{2}' "${codes_file}" | ( #'[0-9]{8} 取YYYYMMDD日期
        while read -r check_date; do
            check_date=$(echo "$check_date" | tr -d '-')
            if [ "$check_date" -le "$end_date" ]; then
                echo "$check_date"
            fi
        done
    ) | sort -rn | head -n 1 )

    #echo -e "${yellow_begin} ${codes_file} $last_changelog_date ${color_end}" #显示输出
    if [ -z "$last_changelog_date" ]; then
        echo -e "${red_begin} ${codes_file} 找不到任何日期! ${color_end}"
    elif [ "$last_changelog_date" -ge "$begin_date" ] && [ "$last_changelog_date" -le "$end_date" ]; then
        echo -e "${green_begin} ${codes_file} 写了changelog,最后一次更新日期为$last_changelog_date ${color_end}"
    else 
        echo -e "${red_begin} ${codes_file} 怀疑没写changelog,最后一次更新日期为$last_changelog_date ${color_end}"
    fi
done

echo -e "${green_begin} 检查完成 ${color_end}"