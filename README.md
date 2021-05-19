# Actions-OpenWrt  

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/jarod360/Lede-OpenWRT/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/jarod360/Lede-OpenWRT.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/jarod360/Lede-OpenWRT.svg?style=flat-square&label=Forks&logo=github)

注：本仓库纯属个人根据自己的设备配置使用，直接FORK本仓库是不能自动编译并发布release的，请看下面使用方法。

## 使用方法

前面的自动编译以及个性化定制等修改，全部来源于P3TER大神的[代码](https://github.com/P3TERX/Actions-OpenWrt)及[教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)。</br>
这里只说发布release的方法，部分代码借鉴或使用[id77](https://github.com/id77/OpenWrt-K2P-firmware)和[ncipollo](https://github.com/ncipollo/release-action)两位大神：</br>
 1、自动编译及自动发布你可以forks本仓库!本仓库每天定时检测Lean's OpenWr的仓库，更新触发自动编译！</br>
 2、点击右上角你的头像-settings-Developer settings-Personal access tokens生成新的令牌，选中public_repo，起名RELEASES,保存，同时复制令牌内容。</br>
 3、回到刚建的新仓库，settings-Secrets-Add a new secret(添加密匙），取名RELEASES_TOKEN,把刚才复制的令牌粘贴进去保存。</br>
 4、微信推送在仓库，settings-Secrets-Add a new secret(添加密匙），取名SERVERCHAN，在http://sc.ftqq.com 获取您的SCKEY，粘贴进去保存。</br>
 5、定时编译的时间、触发自动编译的方法修改都在上面P3TERX大佬的教程里有说明。 </br>
 
## 致谢

- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)   
- [id77](https://github.com/id77/OpenWrt-K2P-firmware)
- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [ncipollo](https://github.com/ncipollo/release-action)
