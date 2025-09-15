#!/bin/bash
#=============================================================================
# iStoreOS RK35XX 构建定制脚本 (diy-part2.sh)
# 描述: 构建过程中的定制化配置和系统优化
# 作者: P3TERX (Modified by xiaomeng9597)
# 博客: https://p3terx.com
# 许可证: MIT
# 更新时间: 2025-09-15
#=============================================================================

set -e  # 脚本出错时立即退出

#-----------------------------------------------------------------------------
# 🔄 更新ubus组件到最新版本
#-----------------------------------------------------------------------------
echo "🔄 更新ubus组件..."
cp -f "$GITHUB_WORKSPACE/configfiles/ubus_Makefile" package/system/ubus/Makefile
echo "✅ ubus组件已更新"

#-----------------------------------------------------------------------------
# 🔗 修复下载镜像服务器问题
#-----------------------------------------------------------------------------
echo "🔗 添加备用下载镜像..."
sed -i "s/push @mirrors, 'https:\/\/mirror2.openwrt.org\/sources';/&\\npush @mirrors, 'https:\/\/github.com\/xiaomeng9597\/files\/releases\/download\/iStoreosFile';/g" scripts/download.pl
echo "✅ 备用下载镜像已添加"

#-----------------------------------------------------------------------------
# 🛠️ RK3588内核优化配置
#-----------------------------------------------------------------------------
echo "🛠️ 优化RK3588内核配置..."
# 移除有问题的RGA2配置
sed -i "/.*CONFIG_ROCKCHIP_RGA2.*/d" target/linux/rockchip/rk35xx/config-5.10
echo "✅ RK3588内核配置已优化"

#-----------------------------------------------------------------------------
# 📶 WiFi功能禁用说明
#-----------------------------------------------------------------------------
echo "📶 WiFi功能状态: 已完全禁用"
echo "   - 原因: 设备无WiFi模块"
echo "   - 效果: 节省固件空间和系统资源"
echo "   - 配置: 所有WiFi相关模块已从配置中移除"

#-----------------------------------------------------------------------------
# 🌐 网络配置优化
#-----------------------------------------------------------------------------
echo "🌐 配置网络参数..."
# 修改默认LAN IP地址为192.168.199.1
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/luci2/bin/config_generate 2>/dev/null || true
echo "✅ 默认LAN IP地址: 192.168.199.1"

# 修改uhttpd配置，启用nginx
sed -i "s/:80/:81/g" package/network/services/uhttpd/files/uhttpd.config
sed -i "s/:443/:4443/g" package/network/services/uhttpd/files/uhttpd.config
echo "✅ uhttpd端口已调整: HTTP 81, HTTPS 4443"

# 复制系统配置文件
cp -a "$GITHUB_WORKSPACE/configfiles/etc/"* package/base-files/files/etc/
echo "✅ 系统配置文件已复制"

#-----------------------------------------------------------------------------
# 📊 集成CPU性能跑分脚本
#-----------------------------------------------------------------------------
echo "📊 集成性能测试工具..."
cp -f "$GITHUB_WORKSPACE/configfiles/coremark/coremark-arm64" package/base-files/files/bin/coremark-arm64
cp -f "$GITHUB_WORKSPACE/configfiles/coremark/coremark-arm64.sh" package/base-files/files/bin/coremark.sh
chmod 755 package/base-files/files/bin/coremark-arm64
chmod 755 package/base-files/files/bin/coremark.sh
echo "✅ CoreMark性能测试工具已集成"

#-----------------------------------------------------------------------------
# 📦 添加第三方软件包
#-----------------------------------------------------------------------------
echo "📦 添加第三方软件包..."

# iStoreOS默认设置
echo "  - 添加iStoreOS默认设置..."
git clone --depth=1 -b main https://github.com/xiaomeng9597/istoreos-settings package/default-settings
echo "✅ iStoreOS默认设置已添加"

# 定时限速插件
echo "  - 添加定时限速插件..."
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
echo "✅ 定时限速插件已添加"

echo "🎉 diy-part2.sh 执行完成"
echo "🛠️ 系统已优化为仅支持RK35XX CYBER3588-AIB设备"