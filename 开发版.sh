#!/bin/bash
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Bin AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-theme-argon
#添加额外软件包
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone https://github.com/Repobor/luci-app-koolproxyR.git package/luci-app-koolproxyR
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/tcping
git clone --depth=1 https://github.com/pexcn/openwrt-chinadns-ng.git package/chinadns-ng
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook
svn co https://github.com/Lienol/openwrt-package/trunk/package/ipt2socks
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-sqm
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-acme
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-aduardhome
git clone https://github.com/garypang13/openwrt-adguardhome package/adguardhome
git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos
git clone https://github.com/garypang13/luci-app-baidupcs-web package/luci-app-baidupcs-web
git clone https://github.com/brvphoenix/luci-app-wrtbwmon package/luci-app-wrtbwmon
git clone https://github.com/brvphoenix/wrtbwmon package/wrtbwmon
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# Add OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash package/OpenClash
# Add Lienol's Packages
git clone --depth=1 https://github.com/SuLingGG/openwrt-package package/Lienol
# Add Rclone-OpenWrt
git clone https://github.com/ElonH/Rclone-OpenWrt package/Rclone-OpenWrt

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
