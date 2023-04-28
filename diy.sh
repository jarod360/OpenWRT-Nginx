#!/bin/bash
# 修改默认 IP
sed -i 's/192.168.1.1/192.168.0.250/g' package/base-files/files/bin/config_generate
# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial-ColorIcon/g' feeds/luci/collections/luci/Makefile
# 修改版本信息
date=`date +%Y.%m.%d`
sed -i 's/OpenWrt/OpenWrt Build '$date' By Jarod Chang/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/%D %V, %C/%D %V, '$date' By Jarod Chang/g' package/base-files/files/etc/banner
#修改luci显示cpu型号方式
sed -i 's/pcdata(boardinfo.model/pcdata(boardinfo.system/g' package/lean/autocore/files/x86/index.htm
#修改GCC版本和binutils版本
#sed -i 's/default GCC_USE_VERSION_8/default GCC_USE_VERSION_11/g' toolchain/gcc/Config.in
#sed -i '22,23d' toolchain/gcc/Config.version
#sed -i '21a\\tdefault "11.2.0"' toolchain/gcc/Config.version
#sed -i '22a\\tdefault "8.4.0"\t\tif GCC_VERSION_8' toolchain/gcc/Config.version
#sed -i 's/default BINUTILS_USE_VERSION_2_34/default BINUTILS_USE_VERSION_2_37/g' toolchain/binutils/Config.in
#sed -i '5d' toolchain/binutils/Config.version
#sed -i '14a\  default y if !TOOLCHAINOPTS' toolchain/binutils/Config.version
#移除uhttpd依赖
sed -i 's/+uhttpd +uhttpd-mod-ubus //g' feeds/luci/collections/luci/Makefile
#修改uwsgi超时时间
sed -i '$a cgi-timeout = 600' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini
sed -i '$a cgi-timeout = 600' feeds/packages/net/uwsgi/files-luci-support/luci-cgi_io.ini
#赋予虚拟机关命令权限
sed -i '57a\chmod 1777 /sbin/shutdown' package/lean/default-settings/files/zzz-default-settings
# 修改内核版本（版本内核默认5.15，还有5.4跟5.10内核）
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
#加入认证证书
sed -i '29a\nginx-util add_ssl _lan "zesun" "/etc/ssl/www.zesun.vip_chain.crt" "/etc/ssl/www.zesun.vip_key.key"' package/lean/default-settings/files/zzz-default-settings
#修改nginx默认传输文件大小
sed -i "30a\uci set nginx._lan.client_max_body_size='800m'" package/lean/default-settings/files/zzz-default-settings
sed -i "31a\uci set nginx._lan.client_header_buffer_size='32k'" package/lean/default-settings/files/zzz-default-settings
sed -i "32a\uci commit nginx" package/lean/default-settings/files/zzz-default-settings
#赋予宿主机密钥权限
sed -i '58a\chmod 755 /root/.ssh & chmod 644 /root/.ssh/known_hosts & chmod 644 /root/.ssh/known_hosts.old' package/lean/default-settings/files/zzz-default-settings
sed -i '59a\chmod 600 /root/.ssh/id_rsa.pub & chmod 600 /root/.ssh/id_rsa' package/lean/default-settings/files/zzz-default-settings
#设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
# 修改插件名字
sed -i 's/"带宽监控"/"带宽"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
#移除内置软件包    
rm -rf feeds/luci/applications/luci-app-docker
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-ttyd
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/utils/ttyd
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-serverchan
#添加额外软件包
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-nginx-manager package/luci-app-nginx-manager
svn co https://github.com/immortalwrt/packages/trunk/lang/node-yarn package/node-yarn
svn co https://github.com/jarod360/packages/trunk/smartdns package/smartdns
svn co https://github.com/zxlhhyccc/bf-package-master/trunk/ntlf9t/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/Dawneng/openwrt-packages/trunk/luci-app-advanced package/luci-app-advanced
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
svn co https://github.com/jarod360/packages/trunk/sub-web package/sub-web
svn co https://github.com/immortalwrt/packages/trunk/libs/jpcre2 package/jpcre2
svn co https://github.com/immortalwrt/packages/trunk/libs/libcron package/libcron
svn co https://github.com/immortalwrt/packages/trunk/libs/rapidjson package/rapidjson
svn co https://github.com/immortalwrt/packages/trunk/libs/toml11 package/toml11
svn co https://github.com/immortalwrt/packages/trunk/libs/quickjspp package/quickjspp
svn co https://github.com/jarod360/packages/trunk/subconverter package/subconverter
svn co https://github.com/jarod360/packages/trunk/ttyd package/ttyd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
git clone https://github.com/jarod360/luci-app-ttyd package/luci-app-ttyd
git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall package/;rm -rf passwall1
#去除xray-core依赖
sed -i 's/+xray-core//g' package/luci-app-passwall/Makefile
#删除passwall重复依赖
rm -rf package/passwall/shadowsocksr-libev
rm -rf package/passwall/v2ray-core
rm -rf package/passwall/v2ray-plugin
rm -rf package/passwall/xray-core
rm -rf package/passwall/xray-plugin
rm -rf package/passwall/naiveproxy
#rm -rf package/helloworld/xray-core
rm -rf package/helloworld/v2raya/
# Add luci-theme-atmaterial-ci
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon package/luci-theme-atmaterial-ColorIcon
# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#更新安装feeds
./scripts/feeds update -a
./scripts/feeds install -a
# 调整argon登录框为居中
sed -i "/.login-page {/i\\
.login-container {\n\
  margin: auto;\n\
  height: 420px\!important;\n\
  min-height: 420px\!important;\n\
  left: 0;\n\
  right: 0;\n\
  bottom: 0;\n\
  margin-left: auto\!important;\n\
  border-radius: 15px;\n\
  width: 350px\!important;\n\
}\n\
.login-form {\n\
  background-color: rgba(255, 255, 255, 0.4)\!important;\n\
  border-radius: 15px;\n\
}\n\
.login-form .brand {\n\
  margin: 15px auto\!important;\n\
}\n\
.login-form .form-login {\n\
    padding: 10px 50px\!important;\n\
}\n\
.login-form .errorbox {\n\
  padding: 10px\!important;\n\
}\n\
.login-form .cbi-button-apply {\n\
  margin: 15px auto\!important;\n\
}\n\
.input-group {\n\
  margin-bottom: 1rem\!important;\n\
}\n\
.input-group input {\n\
  margin-bottom: 0\!important;\n\
}\n\
.ftc {\n\
  bottom: 0\!important;\n\
}" package/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
sed -i "s/margin-left: 0rem \!important;/margin-left: auto\!important;/g" package/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
