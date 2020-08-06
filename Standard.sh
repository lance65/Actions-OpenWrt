#!/bin/bash
#============================================================
# https://github.com/pema1029/Actions-OpenWrt
# File name: Standard.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Author: Microdop
#============================================================

#修改机器名称
sed -i 's/OpenWrt/Microdop/g' package/base-files/files/bin/config_generate
#修改网关地址
sed -i 's/192.168.1.1/10.10.10.131/g' package/base-files/files/bin/config_generate
#修改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
#修改默认主题
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci
#去除默认bootstrap主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#删除旧版argon,链接新版
rm -rf ./package/lean/luci-theme-argon
ln -s ../../../luci-theme-argon ./package/lean/
#修改版本号
sed -i 's/OpenWrt/Microdop Development AutoBuild $(TZ=UTC-8 date "+%Y%m%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/openwrt-packages/luci-app-ssr-plus
#赋予权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns
./scripts/feeds update -a
./scripts/feeds install -a
