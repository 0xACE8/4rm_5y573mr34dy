#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.72/g' package/base-files/files/bin/config_generate

# Set password to PASSWORD
#sed -i 's/root:::0:99999:7:::/root:$1$4xKZB45Q$w0CPT5M6vBWbYNmSWuxfU.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Change language=auto to zh_cn
#sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change luci list name
#sed -i 's/"Argon 主题设置"/"主题设置"/g' feeds/luci/applications/luci-app-argon-config/po/zh_Hans/argon-config.po

sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# change some tips
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po

sed -i 's/START=18/START=99/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init

# DHCP
#mkdir -p package/base-files/files/etc/dnsmasq.d
#wget --no-check-certificate -O package/base-files/files/etc/dnsmasq.d/accelerated-domains.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# upgrade config
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1_3b_1m/main/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings

echo "diy-part2.sh is done."
