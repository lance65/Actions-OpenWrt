#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: Development.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#修改默认ip
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Microdop AutoBuild $(TZ=UTC-8 date "+%Y%m%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/openwrt-packages/brook
svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/openwrt-packages/chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/openwrt-packages/tcping
svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan-go package/openwrt-packages/trojan-go
git clone https://github.com/jerrykuku/luci-theme-argon.git package/openwrt-packages/luci-theme-argon
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
#git clone https://github.com/Repobor/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/openwrt-packages/luci-app-ssr-plus
svn co https://github.com/0saga0/OpenClash/trunk/luci-app-openclash package/openwrt-packages/luci-app-openclash
#赋予koolddns权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns
./scripts/feeds update -a
./scripts/feeds install -a
