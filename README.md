# iStoreOS RK35XX CYBER3588 AIB 固件 | 专为RK3588设备定制

[![iStore使用文档](https://img.shields.io/badge/使用文档-iStore%20OS-brightgreen?style=flat-square)](https://doc.linkease.com/zh/guide/istoreos) [![最新固件下载](https://img.shields.io/github/v/release/xiaomeng9597/Actions-iStoreOS-RK35XX?style=flat-square&label=最新固件下载)](../../releases/latest) [![编译状态](https://img.shields.io/github/actions/workflow/status/xiaomeng9597/Actions-iStoreOS-RK35XX/build-istoreos.yml?style=flat-square&label=编译状态)](../../actions/workflows/build-istoreos.yml)

![支持设备](https://img.shields.io/badge/支持设备:-blueviolet.svg?style=flat-square) ![RK35XX-CYBER3588 AIB](https://img.shields.io/badge/RK35XX--CYBER3588%20AIB-blue.svg?style=flat-square)

> 基于 [iStoreOS](https://github.com/istoreos/istoreos) 的专用固件，专门针对 Rockchip RK3588 CYBER3588 AIB 开发板优化构建。提供稳定、高性能的网络与NAS解决方案。

## 📋 项目概述

**项目背景**: 这是一个基于OpenWrt的定制固件项目，专门为Rockchip RK3588芯片的CYBER3588 AIB开发板提供iStoreOS固件。

**目标用户**: 
- 网络设备开发者
- 嵌入式系统爱好者  
- 固件定制者
- RK3588设备用户

**核心特性**:
- 🚀 专门针对RK3588芯片优化
- 🔄 GitHub Actions自动化编译
- 📦 预配置常用插件和服务
- 🌐 支持路由器和NAS双重功能
- 💾 集成iStore应用商店

## ⚙️ 技术架构

### 系统架构
- **基础系统**: OpenWrt + iStoreOS
- **目标芯片**: Rockchip RK3588 
- **构建平台**: GitHub Actions
- **文件系统**: SquashFS
- **架构**: ARM64 (aarch64)

### 自动化构建流程
```
graph TB
    A[代码提交] --> B[触发GitHub Actions]
    B --> C[同步官方配置]
    C --> D[应用自定义配置]
    D --> E[编译固件]
    E --> F[发布Release]
    F --> G[固件下载]
```

### 目录结构
```
Actions-iStoreOS-RK35XX/
├── .github/workflows/     # GitHub Actions工作流
│   ├── build-istoreos.yml # 主要编译流程
│   └── sync-files.yml     # 配置同步流程
├── configfiles/           # 配置文件目录
│   ├── config_data.txt    # 设备及插件配置
│   ├── coremark/          # 性能测试工具
│   ├── etc/               # 系统配置文件
│   └── ubus_Makefile      # ubus更新包
├── depends/               # 构建依赖
│   └── ubuntu-22.04       # Ubuntu依赖包列表
├── rk35xx/                # RK35XX设备配置
│   ├── .config            # OpenWrt编译配置
│   └── feeds.conf         # 软件源配置
├── diy-part1.sh           # 构建前置脚本
├── diy-part2.sh           # 构建定制脚本
└── README.md              # 项目说明文档
```

## 🟢 默认配置

### 网络访问
- **管理地址**: `http://192.168.199.1` 或 `http://iStoreOS.lan/`
- **默认用户名**: `root`
- **默认密码**: `password`

### 网口配置
- **单网口设备**: 默认为`LAN`口，旁路由模式
- **多网口设备**: 第一个网口为`WAN`口，其他为`LAN`口
- **IP修改**: 可通过首页内网设置或命令 `quickstart` 修改

### 自动化特性
- **定时编译**: 北京时间每天 `0:00` 自动编译
- **版本管理**: `Release` 中保留最新版本，历史版本在 `Actions` 中获取
- **下载要求**: 历史版本需登录 GitHub 才能下载 Artifacts

## 🛠️ 使用指南

### 快速开始

1. **Fork 本仓库**
   ```bash
   # 点击 GitHub 页面右上角的 Fork 按钮
   ```

2. **设置 GitHub Secrets**
   - 进入仓库设置: `Settings` -> `Secrets and variables` -> `Actions`
   - 点击 `New repository secret`
   - Name: `ACCESS_TOKEN`
   - Value: 你的 GitHub Personal Access Token
   
   **获取 Token 方式**:
   - GitHub Settings -> Developer settings -> Personal access tokens -> Tokens (classic)
   - Generate new token -> 选择适当的权限 (repo, workflow)

3. **启动编译**
   - 进入 Actions 页面
   - 选择 "Build iStore OS RK35XX CYBER3588 AIB" 工作流
   - 点击 "Run workflow" 手动触发
   - 或等待每日定时编译

### 插件定制

#### 重要提示
📝 **请将要添加的插件配置填写在 `configfiles/config_data.txt` 文件中**

- ✅ **正确做法**: 修改 `configfiles/config_data.txt`
- ❌ **错误做法**: 直接修改 `rk35xx/.config`（会被同步覆盖）

**特殊情况**: 如果禁用了 "Sync Files" 工作流，则可以直接修改 `rk35xx/.config`

#### 配置示例

在 `configfiles/config_data.txt` 中添加插件：

```bash
# 添加新插件
CONFIG_PACKAGE_luci-app-example=y
CONFIG_PACKAGE_luci-i18n-example-zh-cn=y

# 禁用不需要的功能
# CONFIG_PACKAGE_unwanted-package is not set
```

### 已集成插件

本固件默认集成以下功能模块：

- 💾 **存储管理**: iStore应用商店、文件浏览器
- 📶 **网络功能**: 滚动限速(EQoS+)、USB打印机支持（⚠️ WiFi功能已禁用）
- 📱 **移动网络**: 支持各种PCIe 4G/5G模块、短信功能
- 📊 **系统监控**: CPU性能测试、硬盘休眠管理
- 🔧 **网络服务**: Nginx、DDNS、数据备份
- 🌐 **DNS解析**: mosdns高性能DNS解析器、广告过滤

**📝 重要说明**: 此版本已移除所有WiFi相关模块以节省固件空间和资源，仅支持有线网络连接。

### 性能优化

- **RK3588专用优化**: 针对RK3588芯片特性进行内核调优
- **内存管理**: 启用大页内存支持，提升系统性能
- **网络优化**: 预配置网络加速和流量控制
- **存储优化**: 支持Btrfs文件系统和Docker容器

## 🎯 支持架构

### RK35xx 架构

| 设备           | 包名称                                                                   |
| -------------- | ------------------------------------------------------------------------ |
| RK35XX-CYBER3588-AIB     | istoreos-rockchip-rk35xx-cyber3588_aib-squashfs-sysupgrade.img.gz     |

## ⚠️ 注意事项

### 安全要求
- **必须设置 GitHub Secrets**: `ACCESS_TOKEN` 用于Actions云编译
- **严禁明文存储**: 禁止在可视代码中填写敏感信息

### 工作流配置
- **插件配置同步**: 每天定时执行同步文件工作流会自动更新官方配置
- **配置优先级**: `configfiles/config_data.txt` > `rk35xx/.config`

### 已知限制
- Artifacts需要登录GitHub下载
- 固件构建依赖GitHub Actions环境
- 每天定时编译仅保留最新版本

## 🚀 高级用法

### 本地开发环境

如需本地开发，请准备以下环境：

```bash
# Ubuntu 22.04 推荐依赖包
sudo apt update
sudo apt install ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2 python3.6 python3 python3-pyelftools libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
```

### 构建脚本说明

- **diy-part1.sh**: 构建前置处理，配置软件源和版本信息
- **diy-part2.sh**: 构建定制化处理，应用补丁和优化配置

### 故障排除

#### 编译失败
1. 检查 `ACCESS_TOKEN` 是否正确设置
2. 查看 Actions 日志确定具体错误
3. 确认依赖包版本兼容性

#### 配置丢失
1. 确认配置写入 `configfiles/config_data.txt`
2. 检查 "Sync Files" 工作流是否启用
3. 验证配置语法正确性

## 🙏 鸣谢

- [istoreos](https://github.com/istoreos/istoreos) - 上游iStoreOS项目
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt) - GitHub Actions模板
- [OpenWrt](https://github.com/openwrt/openwrt) - 基础固件框架
- [GitHub Actions](https://github.com/features/actions) - 自动化构建平台
- [kenzok8/small-package](https://github.com/kenzok8/small-package) - 优秀的OpenWrt软件包集合
- 所有贡献者和使用者

## 📜 开源协议

本项目基于 MIT 协议开源，详见 [LICENSE](LICENSE) 文件。

## 💝 支持项目

如果这个项目对你有帮助，欢迎：

- ⭐ 给项目点个 Star
- 🐛 报告问题和建议
- 🔧 提交代码改进
- 📢 推荐给其他人使用

---

**免责声明**: 本项目仅供学习交流使用，使用过程中产生的任何问题由使用者自行承担。