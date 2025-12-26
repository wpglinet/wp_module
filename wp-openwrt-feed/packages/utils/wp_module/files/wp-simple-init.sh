#!/bin/sh

# 第一次启动时执行
if [ ! -f /tmp/my-module-done ]; then
    # 1. 设置WiFi SSID
    uci set wireless.default_radio1.ssid='gl-inet'
    uci commit wireless
    
    # 2. 设置密码
    echo -e "goodlife\ngoodlife" | passwd root >/dev/null 2>&1
    
    # 3. 禁用SSH
    uci set dropbear.main.enable='0'
    uci commit dropbear
    /etc/init.d/dropbear disable
    
    touch /tmp/wp-module-done
    echo "Default settings applied"
fi

exit 0