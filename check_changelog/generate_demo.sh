#!/bin/bash

# 创建测试目录
mkdir -p ./test
cd ./test || exit

# 生成多个测试文件
cat <<EOL > 20240115.txt
# Changelog
# 20240115 Create
EOL

cat <<EOL > no.txt
# No Changelog here
EOL

cat <<EOL > 20241101.txt
# Changelog
# 20241001 Update
# 20241101 Fix
EOL

cat <<EOL > 20241030.txt
# 2024-10-30 Some changes
EOL

cat <<EOL > 20250520.txt
# Last Update
# 20250520 Previous work
EOL
