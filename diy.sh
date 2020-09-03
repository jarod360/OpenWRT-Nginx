#!/bin/bash
# Modify default IP
#sed -i 's/192.168.1.1/192.168.0.250/g' package/base-files/files/bin/config_generate

#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-theme-argon
#添加额外软件包
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR package/luci-app-koolproxyR
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/brook
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/ipt2socks package/ipt2socks
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-sqm package/luci-app-sqm
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-acme package/luci-app-acme
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/luci-app-control-timewol
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-aduardhome
git clone https://github.com/garypang13/openwrt-adguardhome package/adguardhome
git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos
git clone https://github.com/garypang13/luci-app-baidupcs-web package/luci-app-baidupcs-web
git clone https://github.com/brvphoenix/luci-app-wrtbwmon package/luci-app-wrtbwmon
git clone https://github.com/brvphoenix/wrtbwmon package/wrtbwmon
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/pymumu/luci-app-smartdns -b lede package/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone https://github.com/kenzok8/small.git package/small
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
git clone https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/jerrykuku/node-request.git package/node-request

# Add Rclone-OpenWrt
git clone https://github.com/ElonH/Rclone-OpenWrt package/Rclone-OpenWrt
# Add luci-theme-atmaterial-ci
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/luci-theme-atmaterial-ColorIcon
# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

#加载个性化配置
cp -f ../default-settings package/lean/default-settings/files/zzz-default-settings

./scripts/feeds update -a
./scripts/feeds install -a
