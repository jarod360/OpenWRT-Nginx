#!/bin/bash
# 修改默认 IP
sed -i 's/192.168.1.1/192.168.0.250/g' package/base-files/files/bin/config_generate
# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial-ColorIcon/g' feeds/luci/collections/luci/Makefile
# 修改版本信息
date=`date +%Y.%m.%d`
sed -i 's/OpenWrt/OpenWrt Build '$date' By Jarod Chang/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/%D %V, %C/%D %V, '$date' By Jarod Chang/g' package/base-files/files/etc/banner
#加入定时清理内存
sed -i "28a\echo \'*/60 * * * * sh /etc/memclean.sh\' > /etc/crontabs/root" package/lean/default-settings/files/zzz-default-settings
#加入认证证书
sed -i '29a\nginx-util add_ssl _lan "zesun" "/etc/ssl/www.zesun.vip_chain.crt" "/etc/ssl/www.zesun.vip_key.key"' package/lean/default-settings/files/zzz-default-settings
#赋予定时清理内存脚本权限
sed -i '56a\chmod 1777 /etc/memclean.sh' package/lean/default-settings/files/zzz-default-settings
sed -i '57a\chmod 1777 /sbin/shutdown' package/lean/default-settings/files/zzz-default-settings
#设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
# 修改插件名字
sed -i 's/"带宽监控"/"带宽"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
#sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
#移除不用软件包    
rm -rf package/lean/luci-app-docker
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-app-ttyd
rm -rf feeds/packages/utils/ttyd
rm -rf feeds/luci/collections/luci
#添加额外软件包
svn co https://github.com/jarod360/luci/trunk/collections/luci feeds/luci/collections/luci
svn co https://github.com/immortalwrt/packages/trunk/lang/node-yarn package/node-yarn
svn co https://github.com/siropboy/mypackages/trunk/smartdns package/smartdns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-smartdns package/luci-app-smartdns
#svn co https://github.com/Beginner-Go/my-packages/trunk/luci-app-koolproxyR  package/luci-app-koolproxyR
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-advanced package/luci-app-advanced
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
svn co https://github.com/jarod360/packages/trunk/sub-web package/sub-web
svn co https://github.com/kiddin9/openwrt-packages/trunk/jpcre2 package/jpcre2
svn co https://github.com/jarod360/packages/trunk/libcron package/libcron
svn co https://github.com/jarod360/packages/trunk/quickjspp package/quickjspp
svn co https://github.com/kiddin9/openwrt-packages/trunk/rapidjson package/rapidjson
svn co https://github.com/kiddin9/openwrt-packages/trunk/toml11 package/toml11
svn co https://github.com/jarod360/packages/trunk/subconverter package/subconverter
svn co https://github.com/jarod360/packages/trunk/ttyd package/ttyd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
git clone https://github.com/jarod360/luci-app-ttyd package/luci-app-ttyd
git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
#git clone https://github.com/kiddin9/luci-app-baidupcs-web package/luci-app-baidupcs-web
#git clone https://github.com/brvphoenix/luci-app-wrtbwmon package/luci-app-wrtbwmon
#git clone https://github.com/brvphoenix/wrtbwmon package/wrtbwmon
#git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
git clone https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
rm -rf package/passwall/shadowsocksr-libev
rm -rf package/passwall/v2ray-core
rm -rf package/passwall/v2ray-plugin
rm -rf package/passwall/xray-core
rm -rf package/passwall/xray-plugin
rm -rf package/passwall/naiveproxy

# Add Rclone-OpenWrt
git clone https://github.com/ElonH/Rclone-OpenWrt package/Rclone-OpenWrt
# Add luci-theme-atmaterial-ci
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/luci-theme-atmaterial-ColorIcon
# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
