# iStoreOS RK35XX CYBER3588 AIB 软件包与内核模块分析

## 📋 目录
- [🎯 目标设备](#目标设备)
- [🏗️ 内核模块分析](#内核模块分析)
- [📦 应用软件包](#应用软件包)
- [🌐 网络模块](#网络模块)
- [💾 存储与文件系统](#存储与文件系统)
- [🔧 系统工具](#系统工具)
- [🎛️ Web界面与管理](#web界面与管理)

---

## 🎯 目标设备

| 配置项 | 值 | 说明 |
|--------|----|----|
| **目标架构** | `CONFIG_TARGET_rockchip_rk35xx` | Rockchip RK35XX系列 |
| **具体设备** | `CONFIG_TARGET_DEVICE_rockchip_rk35xx_DEVICE_cyber3588_aib=y` | CYBER3588 AIB开发板 |

---

## 🏗️ 内核模块分析

### 🚀 RK3588专用模块
| 模块 | 功能 | 重要程度 | 状态 |
|------|------|----------|------|
| `kmod-drm-rockchip-rk35xx` | 🎮 RK35XX显示驱动 | ⭐⭐⭐⭐⭐ | ✅ 已启用 |
| `kmod-drm-rockchip-rk35xx-hdmi-audio` | 🔊 HDMI音频输出 | ⭐⭐⭐⭐ | ✅ 已启用 |
| `kmod-drm-rockchip-rk35xx-hdmitx` | 📺 HDMI视频输出 | ⭐⭐⭐⭐ | ✅ 已启用 |
| `kmod-rkgpu-bifrost` | 🎮 Mali-G610 GPU驱动 | ⭐⭐⭐⭐⭐ | ✅ 已启用 |
| `kmod-rkgpu-bifrost-csf-coex` | 🎮 GPU调度共存支持 | ⭐⭐⭐ | ✅ 已启用 |
| `kmod-rkgpu-mali400` | 🎮 Mali-400 GPU支持 | ⭐⭐⭐ | ✅ 已启用 |
| `kmod-rknpu` | 🧠 AI神经网络处理单元(6TOPS) | ⭐⭐⭐⭐⭐ | ✅ 已启用 |
| `kmod-rkwifi-bcmdhd-pcie` | 📶 Rockchip WiFi驱动 | ⭐⭐⭐⭐ | ❌ 已禁用 |
| `kmod-sound-soc-rockchip` | 🔊 RK3588音频子系统 | ⭐⭐⭐⭐ | ✅ 已启用 |

### 🌐 网络模块
| 类别 | 模块 | 功能说明 | 状态 |
|------|------|----------|------|
| **VPN协议** | `kmod-wireguard` | WireGuard VPN | ✅ 已启用 |
| **VPN协议** | `kmod-ipsec*` | IPSec VPN完整支持 | ✅ 已启用 |
| **网络功能** | `kmod-nat46` | IPv4/IPv6转换 | ✅ 已启用 |
| **网络功能** | `kmod-macvlan` | 虚拟LAN接口 | ✅ 已启用 |
| **网络加速** | `kmod-nf-flow` | 网络流量卸载 | ✅ 已启用 |
| **以太网** | `kmod-r8126` | Realtek RTL8125网卡 | ✅ 已启用 |
| **网络统计** | `kmod-pktgen` | 网络性能测试 | ✅ 已启用 |

### 🔌 USB与外设
| 功能类别 | 包含模块 | 用途 | 状态 |
|----------|----------|------|------|
| **USB控制器** | `kmod-usb2`, `kmod-usb3`, `kmod-usb-xhci-hcd` | USB 2.0/3.0/3.1完整支持 | ✅ 已启用 |
| **USB网卡** | `kmod-usb-net-*` (30+驱动) | 各厂商USB网卡全覆盖 | ✅ 已启用 |
| **USB存储** | `kmod-usb-storage*` | USB存储设备+UAS加速 | ✅ 已启用 |
| **USB串口** | `kmod-usb-serial-*` (25+驱动) | 全系列USB转串口芯片 | ✅ 已启用 |
| **USB打印机** | `kmod-usb-printer` | USB打印机支持 | ✅ 已启用 |
| **移动网络** | `kmod-pcie_mhi` | PCIe接口4G/5G模块 | ✅ 已启用 |
| **USB音频** | `kmod-usb-audio`, `kmod-usb-cm109` | USB声卡和话筒支持 | ✅ 已启用 |
| **USB视频** | `kmod-video-uvc` | USB摄像头支持 | ✅ 已启用 |
| **USB Gadget** | `kmod-usb-gadget-*` | USB设备模式支持 | ✅ 已启用 |

### 💾 存储与文件系统
| 类别 | 模块 | 支持格式/功能 | 状态 |
|------|------|---------------|------|
| **文件系统** | `kmod-fs-ext4` | EXT4文件系统+ACL支持 | ✅ 已启用 |
| **文件系统** | `kmod-fs-btrfs` | Btrfs文件系统+快照支持 | ✅ 已启用 |
| **文件系统** | `kmod-fs-ntfs3-oot` | NTFS3文件系统(原生内核) | ✅ 已启用 |
| **文件系统** | `kmod-fs-vfat` | FAT32/FAT16文件系统 | ✅ 已启用 |
| **文件系统** | `kmod-fs-f2fs` | F2FS Flash优化文件系统 | ✅ 已启用 |
| **文件系统** | `kmod-fs-exfat` | exFAT文件系统 | ✅ 已启用 |
| **网络文件系统** | `kmod-fs-nfs*` | NFS v3/v4客户端和服务端 | ✅ 已启用 |
| **网络文件系统** | `kmod-fs-cifs` | SMB/CIFS文件共享 | ✅ 已启用 |
| **RAID** | `kmod-md-*` | 软件RAID 0/1/10/456支持 | ✅ 已启用 |
| **块设备** | `kmod-dm*` | 设备映射器+加密支持 | ✅ 已启用 |
| **压缩文件系统** | `kmod-fs-squashfs` | SquashFS只读文件系统 | ✅ 已启用 |

### 🔐 安全与加密
| 模块 | 功能 | 状态 |
|------|------|------|
| `kmod-crypto-*` | 硬件加密算法支持 | ✅ 已启用 |
| `kmod-keys-*` | 内核密钥管理子系统 | ✅ 已启用 |
| `kmod-tpm` | TPM 2.0安全芯片支持 | ✅ 已启用 |
| `kmod-crypto-gcm` | GCM加密模式 | ✅ 已启用 |
| `kmod-crypto-lib-chacha20` | ChaCha20加密算法 | ✅ 已启用 |
| `kmod-crypto-lib-curve25519` | Curve25519算法支持 | ✅ 已启用 |

---

## 📦 应用软件包

### 🌐 Web服务器
| 软件包 | 功能 | 配置 |
|--------|------|------|
| `nginx` | Web服务器 | ✅ 启用SSL |
| `nginx-ssl` | SSL支持 | ✅ 已安装 |
| `nginx-mod-luci` | LuCI集成 | ✅ 已安装 |
| `luci-nginx` | Nginx管理界面 | ✅ 已安装 |

### 🐳 容器技术
| 软件包 | 功能 |
|--------|------|
| `docker` | Docker容器引擎 |
| `dockerd` | Docker守护进程 |
| `containerd` | 容器运行时 |
| `runc` | 低级容器运行时 |

### 📏 DNS解析器支持
| 软件包 | 功能 | 特性 |
|--------|------|------|
| `mosdns` | 现代化DNS解析器 | 高性能、分流支持 |
| `luci-app-mosdns` | mosdns Web管理界面 | 中文支持、图形化配置 |

### 📱 移动网络支持 (PCIe专用)
| 软件包 | 功能 | 设备支持 |
|--------|------|----------|
| `modemmanager` | 调制解调器管理 | 通用PCIe 4G/5G模块 |
| `sendat` | AT指令工具 | ✅ |
| `sms-tool` | 短信工具 | ✅ |
| `meig-cm` | MEIG模块支持 | PCIe版本 |
| `quectel-CM-5G` | 移远5G模块 | PCIe版本 |

### 💾 存储与文件管理
| 软件包 | 功能 |
|--------|------|
| `luci-app-filebrowser` | 文件浏览器 |
| `luci-app-samba4` | SMB/CIFS文件共享 |
| `luci-app-nfs` | NFS文件共享 |
| `luci-app-diskman` | 磁盘管理工具 |

### 🛠️ 系统工具
| 软件包 | 功能 |
|--------|------|
| `htop` | 系统监控 |
| `stress` | 系统压力测试 |
| `hdparm` | 硬盘工具 |
| `lsblk` | 块设备列表 |
| `fdisk` | 磁盘分区 |
| `parted` | 高级分区工具 |

---

## 🌐 网络模块

### 📶 WiFi支持状态
| 设备类型 | 固件包 | 状态 |
|----------|--------|------|
| **Realtek** | `rtl8*-firmware` | ❌ 已禁用 |
| **Rockchip** | `rkwifi-firmware-*` | ❌ 已禁用 |
| **Intel** | `iwlwifi-firmware-*` | ❌ 已禁用 |
| **Broadcom** | `brcmfmac-firmware-*` | ❌ 已禁用 |
| **MediaTek** | `mt76*-firmware` | ❌ 已禁用 |

📝 **说明**: 所有WiFi相关的内核模块和固件包已被禁用，以减少固件体积和节省资源。

### 🔌 网络接口
| 功能 | 模块/包 |
|------|--------|
| **以太网控制器** | `kmod-r8169`, `kmod-igb`, `kmod-e1000` |
| **交换机支持** | `kmod-dsa-mv88e6xxx` |
| **网络绑定** | `kmod-bonding` |
| **虚拟网络** | `kmod-veth`, `kmod-macvlan` |

---

## 💾 存储与文件系统

### 📁 文件系统支持
| 文件系统 | 读写支持 | 用途 |
|----------|----------|------|
| **EXT4** | ✅ 完整 | Linux主文件系统 |
| **Btrfs** | ✅ 完整 | 高级特性支持 |
| **NTFS** | ✅ 完整 | Windows兼容 |
| **FAT32** | ✅ 完整 | 通用兼容 |
| **F2FS** | ✅ 完整 | Flash优化 |

### 🏗️ RAID支持
| RAID级别 | 模块 | 功能 |
|----------|------|------|
| **RAID 0** | `kmod-md-raid0` | 条带化 |
| **RAID 1** | `kmod-md-raid1` | 镜像 |
| **RAID 10** | `kmod-md-raid10` | 条带镜像 |
| **RAID 456** | `kmod-md-raid456` | 分布式奇偶校验 |

---

## 🔧 系统工具

### ⚡ 性能工具
| 工具 | 功能 | 安装位置 |
|------|------|----------|
| `coremark-arm64` | CPU性能测试 | `/bin/coremark-arm64` |
| `coremark.sh` | 性能测试脚本 | `/bin/coremark.sh` |
| `stress` | 系统压力测试 | 系统PATH |
| `htop` | 进程监控 | 系统PATH |

### 🔧 维护工具
| 工具类型 | 包含工具 |
|----------|----------|
| **磁盘工具** | `hdparm`, `badblocks`, `fsck.*` |
| **网络工具** | `iperf3`, `etherwake`, `iw`, `iwinfo` |
| **调试工具** | `adb`, `lrzsz`, `tcpdump` |

---

## 🎛️ Web界面与管理

### 🌐 LuCI应用
| 应用 | 功能 | 中文支持 |
|------|------|----------|
| `luci-app-store` | ✅ iStore应用商店 | ✅ |
| `luci-app-quickstart` | ✅ 快速设置向导 | ✅ |
| `luci-app-dockerman` | ✅ Docker管理 | ✅ |
| `luci-app-ddns` | ✅ 动态DNS | ✅ |
| `luci-app-upnp` | ✅ UPnP服务 | ✅ |
| `luci-app-firewall` | ✅ 防火墙管理 | ✅ |
| `luci-app-ttyd` | ✅ Web终端 | ✅ |
| `luci-app-cpufreq` | ✅ CPU频率调节 | ✅ |
| `luci-app-fan` | ✅ 风扇控制 | ✅ |
| `luci-app-oled` | ✅ OLED显示屏 | ✅ |

### 🔌 扩展应用 (自定义添加)
| 应用 | 功能 | 状态 |
|------|------|------|
| `luci-app-usb-printer` | USB打印机支持 | ✅ 已添加 |
| `luci-app-hd-idle` | 硬盘休眠管理 | ✅ 已添加 |
| `luci-app-filebrowser` | 文件浏览器 | ✅ 已添加 |
| `luci-app-modem` | 调制解调器管理 | ✅ 已添加 |
| `luci-app-eqosplus` | 定时限速管理 | ✅ 已添加 |
| `luci-app-mosdns` | DNS解析器管理 | ✅ 已添加 |

---

## 🔍 关键特性总结

### ✨ RK3588专用优化
- 🎮 **GPU加速**: Mali GPU + NPU神经网络处理
- 📺 **多媒体**: 硬件编解码 + HDMI音视频输出
- 🚀 **高性能**: 专用驱动优化

### 🌐 网络功能 (优化后)
- ✖️ **WiFi支持**: 已禁用所有WiFi相关模块
- 📱 **蜂窝网络**: 仅支持PCIe接口(USB接口已禁用)
- 🔗 **多种VPN**: WireGuard + IPSec
- 🌐 **以太网**: 完整有线网络支持

### 💾 存储方案
- 🗄️ **多文件系统**: EXT4/Btrfs/NTFS/FAT32/F2FS
- 🏗️ **RAID支持**: 软件RAID 0/1/10/456
- ☁️ **网络存储**: NFS + SMB/CIFS

### 🐳 容器化
- 🐳 **Docker完整支持**: 引擎 + 管理界面
- 📦 **多种存储后端**: Btrfs + EXT4

### 🎛️ 管理界面
- 🌐 **现代化Web界面**: Nginx + LuCI
- 🇨🇳 **完整中文支持**: 所有应用汉化
- 🛠️ **丰富扩展**: 存储/网络/系统管理

---

**📝 说明**: 此分析基于 `rk35xx/.config` 和 `configfiles/config_data.txt` 配置文件生成，涵盖了固件中包含的所有主要软件包和内核模块。

---

## 🚀 系统优化配置

### 🔋 内核优化参数
| 配置项 | 状态 | 功能说明 |
|--------|------|----------|
| `CONFIG_KERNEL_TRANSPARENT_HUGEPAGE=y` | ✅ 已启用 | 透明大页内存支持 |
| `CONFIG_KERNEL_HUGETLBFS=y` | ✅ 已启用 | 大页文件系统支持 |
| `CONFIG_KERNEL_CGROUP_*` | ✅ 已启用 | 完整的CGroup支持 |
| `CONFIG_KERNEL_MEMCG_SWAP_ENABLED=y` | ✅ 已启用 | 内存组交换支持 |
| `CONFIG_KERNEL_PSI=y` | ✅ 已启用 | 压力状态信息监控 |
| `CONFIG_KERNEL_PERF_EVENTS=y` | ✅ 已启用 | 性能事件监控 |

### 🔥 安全强化
| 安全特性 | 状态 | 说明 |
|----------|------|------|
| `CONFIG_OPENSSL_WITH_TLS13=y` | ✅ 已启用 | TLS 1.3支持 |
| `CONFIG_OPENSSL_WITH_CHACHA_POLY1305=y` | ✅ 已启用 | 现代加密算法 |
| `CONFIG_OPENSSL_WITH_ERROR_MESSAGES=y` | ✅ 已启用 | 详细错误信息 |
| `CONFIG_GNUTLS_*` | ✅ 已启用 | GnuTLS完整支持 |

### 🐳 Docker优化
| Docker特性 | 状态 | 功能 |
|------------|------|------|
| `CONFIG_DOCKER_STO_BTRFS=y` | ✅ 已启用 | Btrfs存储驱动 |
| `CONFIG_DOCKER_STO_EXT4=y` | ✅ 已启用 | EXT4存储驱动 |
| `CONFIG_DOCKER_NET_*` | ✅ 已启用 | 完整网络支持 |
| `CONFIG_DOCKER_OPTIONAL_FEATURES=y` | ✅ 已启用 | 可选功能全开 |

### 📶 网络优化
| 网络功能 | 状态 | 功能说明 |
|----------|------|----------|
| `kmod-nf-flow` | ✅ 已启用 | 网络流量卸载加速 |
| `kmod-sched-cake` | ✅ 已启用 | CAKE队列管理 |
| `kmod-sched-bpf` | ✅ 已启用 | eBPF网络调度 |
| `kmod-pktgen` | ✅ 已启用 | 网络性能测试 |