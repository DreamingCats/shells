#!/system/bin/sh

# 用于双清后快速下载安装apk

apk_path="/storge/emulated/0/Download/apks/temp.apk"

# $1: APK 下载 URL    $2: 应用包名
install_apk() {
    apk_url="$1"
    package_name="$2"
    
    # 检查应用是否已安装
    if ! pm list packages | grep -q "$package_name"; then
        # 下载并安装 APK
        curl -o "$apk_path" -L "$apk_url"
        pm install "$apk_path" && rm -f "$apk_path"
        echo "已安装 $package_name"
    else
        echo "应用 $package_name 已安装，跳过"
    fi
}


# Install apk

# 腾讯系
install_apk "com.tencent.mobileqq" "https://down.bytes.tcdnos.com/qqweb/QQ_1/android_apk/Android_9.0.95_64.apk" "QQ"
install_apk "com.tencent.mm" "https://dldir1.qq.com/weixin/android/weixin8050android2701_0x28003294_arm64.apk" "微信"

# 阿里系


# 酷安(全功能版)


# 哔哩哔哩

# demo
# install_apk "https://example.com/path/to/app3.apk" "com.example.app3"

echo "[`date '+%Y%m%d %H:%M:%S'`] 脚本执行完毕，线程退出" >> $MODPATH/run.log


exit 0
