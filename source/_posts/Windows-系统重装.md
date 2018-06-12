---
title: Windows | 系统重装
id: windows-reos
comments: true
date: 2018-04-10 12:09:34
tags:
- reOS
categories: Windows
toc: true
reward: true
---

<!--# Windows | 系统重装-->

- 传统：LegacyBIOS+MBR
- 新型：UEFI+GPT



- LegacyBIOS：基本输入输出系统，[传统]
- UEFI：统一可扩展固件接口，[新型]
- MBR：主引导记录磁盘分区格式，[Legacy]
- GPT：GUID全局唯一标识磁盘分区表，[UEFI]

<!-- more -->

# Win7 系统重装

Win7重装系统：LegacyBIOS+MBR

## 一、准备工作
- 下载系统镜像：搜索[mdsn，我告诉你](https://msdn.itellyou.cn/)，复制系统的【ed2k链接】，粘贴至迅雷下载系统ISO镜像。
- 制作U盘启动盘：下载微软官方工具 [Windows USB/DVD Download Tool](https://www.microsoft.com/en-us/download/details.aspx?id=56485)，**格式化**U盘，制作启动盘。
- 下载网卡驱动：登录【本机机型官网】，寻求【服务支持】，下载【网卡驱动程序】。

## 二、重装系统

1.BIOS设置：开机进入【BIOS设置程序】，设置【USB】为【第一启动项】，保存退出。

  > ？：机型不同，BIOS设置方式不同，可自行百度；

2.磁盘分区：进入系统安装界面，安装方式选择【自定义安装】，自行分区。

> ？：如果是win10/8换win7系统，请将GPT分区转换为MBR分区：
>
> ```shell
> # 在windows系统安装界面 Shift+F10 调出控制台。
> diskpart      # 进入DiskPart工具
> list disk     # 列出磁盘信息
> select disk n # 选择需要操作的磁盘，n为磁盘编号。
> clean         # 清理磁盘所有数据
> convert mbr   # 转换为MBR分区形式
> ```

3.等待......

4.网卡驱动：通过U盘安装已下载的网卡驱动，连接网络。

5.其他驱动：下载驱动软件【驱动大师】【驱动精灵】等，一键检测下载驱动。

6.BIOS设置：开机进入【BIOS设置程序】，设置【HardDisk】为【第一启动项】，保存退出。

7.激活系统：在[淘宝](https://s.taobao.com)10块钱买个激活码，激活系统。





# Win10 系统重装

Win10重装系统：UEFI+GPT

## 一、准备工作

1.下载微软官方工具 [MediaCreationTool.exe](https://www.microsoft.com/zh-cn/software-download/windows10?OCID=WIP_r_Win10_Body_AddPC) ，选择【为另一台电脑创建安装介质】，制作U盘启动盘。

## 二、重装系统

1.BIOS设置：开机进入【BIOS设置程序】，设置【USB】为【第一启动项】，保存退出。

> ？：机型不同，BIOS设置方式不同，可自行百度；

2.磁盘分区：进入系统安装界面，安装方式选择【自定义安装】，自行分区。

> ？：如果是win7换win10/8系统，请将MBR分区转换为GPT分区：
>
> ```shell
> # 在windows系统安装界面 Shift+F10 调出控制台。
> diskpart      # 进入DiskPart工具
> list disk     # 列出磁盘信息
> select disk n # 选择需要操作的磁盘，n为磁盘编号。
> clean         # 清理磁盘所有数据
> convert gpt   # 转换为GPT分区形式
> ```

3.等待......

4.BIOS设置：开机进入【BIOS设置程序】，设置【HardDisk】为【第一启动项】，保存退出。

5.激活系统：在[淘宝](https://s.taobao.com)10块钱买个激活码，激活系统。

