#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: Standard.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

#修改默认IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Microdop AutoBuild $(TZ=UTC-8 date "+%Y%m%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
git clone https://github.com/Repobor/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/openwrt-packages/luci-app-ssr-plus
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom
#赋予koolddns权限
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns
./scripts/feeds update -a
./scripts/feeds install -a
