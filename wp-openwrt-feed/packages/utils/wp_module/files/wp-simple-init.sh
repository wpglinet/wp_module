#!/bin/sh

START=99

[ -f /tmp/wp-done ] && exit 0

# 1. ......WiFi
uci set wireless.default_radio0.ssid='gl-inet'
uci set wireless.default_radio1.ssid='gl-inet-5G'
uci commit wireless

# 2........password
echo "2. 设置root密码为goodlife..."
if echo -e "goodlife\ngoodlife" | passwd root >/dev/null 2>&1; then
        echo ".................."
else
        echo "密码设置失败，使用备用方法,利用哈希值"
        sed -i 's/root:.*:/root:$1$wEehtjxj$YBu1quNfMkje5EF9wzh9q0:0:0:99999:7:::/' /etc/shadow 2>/dev/null
fi

# 3. ...SSH
uci set dropbear.main.enable='0'
uci commit dropbear

touch /tmp/wp-done
