#!/bin/bash
#=============================================================================
# iStoreOS RK35XX 构建前置脚本 (diy-part1.sh)
# 描述: 构建前的初始化配置和软件源准备
# 作者: P3TERX (Modified by xiaomeng9597)
# 博客: https://p3terx.com
# 许可证: MIT
# 更新时间: 2025-09-15
#=============================================================================

set -e  # 脚本出错时立即退出

#-----------------------------------------------------------------------------
# 📅 生成版本号 - 使用编译日期作为数字版本
#-----------------------------------------------------------------------------
echo "📅 生成版本号..."
date_version=$(date +"%Y%m%d%H")
echo "$date_version" > version
echo "✅ 版本号: $date_version"

#-----------------------------------------------------------------------------
# 🏷️ 设置固件作者标识
#-----------------------------------------------------------------------------
echo "🏷️ 配置固件作者标识..."
author="xiaomeng9597"
# 修改OpenWrt发行信息
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release
echo "✅ 作者标识已设置: $author"

#-----------------------------------------------------------------------------
# 📦 添加自定义软件包仓库
#-----------------------------------------------------------------------------
echo "📦 添加自定义软件包仓库..."
echo 'src-git xmpackages https://github.com/xiaomeng9597/openwrt-packages2.git;main' >> feeds.conf.default
echo "✅ 软件包仓库已添加: xiaomeng9597/openwrt-packages2"

echo "🎉 diy-part1.sh 执行完成"
