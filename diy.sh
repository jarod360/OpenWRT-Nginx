#!/bin/bash
# 修改默认 IP
sed -i 's/192.168.1.1/192.168.0.250/g' package/base-files/files/bin/config_generate
# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial-ColorIcon/g' feeds/luci/collections/luci/Makefile
# 修改版本信息
date=`date +%Y.%m.%d`
sed -i 's/OpenWrt/OpenWrt Build '$date' By JarodChang/g' package/lean/default-settings/files/zzz-default-settings
# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-theme-argon
#rm -rf feeds/packages/net/https-dns-proxy
#添加额外软件包
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy package/https-dns-proxy
svn co https://github.com/siropboy/mypackages/trunk/smartdns package/smartdns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/Beginner-Go/my-packages/trunk/luci-app-koolproxyR  package/luci-app-koolproxyR
#svn co https://github.com/openwrt/luci/trunk/applications/luci-app-sqm package/luci-app-sqm
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-advanced package/luci-app-advanced
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol
svn co https://github.com/jarod360/packages/trunk/sub-web package/sub-web
svn co https://github.com/garypang13/openwrt-packages/trunk/jpcre2 package/jpcre2
svn co https://github.com/garypang13/openwrt-packages/trunk/libcron package/libcron
svn co https://github.com/garypang13/openwrt-packages/trunk/quickjspp package/quickjspp
svn co https://github.com/garypang13/openwrt-packages/trunk/rapidjson package/rapidjson
svn co https://github.com/jarod360/packages/trunk/subconverter package/subconverter
git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos
git clone https://github.com/garypang13/luci-app-baidupcs-web package/luci-app-baidupcs-web
git clone https://github.com/brvphoenix/luci-app-wrtbwmon package/luci-app-wrtbwmon
git clone https://github.com/brvphoenix/wrtbwmon package/wrtbwmon
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
git clone https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

# Add Rclone-OpenWrt
git clone https://github.com/ElonH/Rclone-OpenWrt package/Rclone-OpenWrt
# Add luci-theme-atmaterial-ci
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/luci-theme-atmaterial-ColorIcon
# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

./scripts/feeds update -a
./scripts/feeds install -a
