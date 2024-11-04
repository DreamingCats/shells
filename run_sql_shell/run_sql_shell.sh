#!/bin/bash

# 批量调起sql

# Changelog
# 20240912 Create

env=dev  # Set run environment Option:dev/prd
sql_timeout=300s # Set timeout
sql_dir=~/test # Set dir

# Set color
green_begin='\033[32m '
red_begin='\033[31m '
yellow_begin='\033'
blue_begin='\033[38;2;102;204;255m]' # RGB #66ccff
color_end='\033[0m'

# Run sql

# Prevent from logout
echo -e "本次操作执行完成!已自动执行cat防止掉线,使用Ctrl+C退出shell"
cat >dev/null
exit 1