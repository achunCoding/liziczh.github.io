---
title: Diskpart | MBR分区转GPT分区
comments: true
date: 2018-05-01 01:07:48
id: diskpart-mbrtogpt
tags:
- reOS
categories:
---

<!--# Diskpart | MBR分区转GPT分区-->

最近不想继续用win7了，于是换了最新的win10系统。由于微软官方提供了工具 MediaCreationTool.exe ，既可以直接升级本机到win10系统，也可以为另一台电脑创建安装介质（U盘启动盘，DVD），win10系统的安装异常简单方便，在此不多赘述。由于想体验一下UEFI启动，但是格式化硬盘之前忘记改磁盘分区表了，装机时出现了一些小麻烦，所以在此记录一下解决方法。

<!--more-->

**问题：**格式化硬盘之前忘记将磁盘分区表由MBR更改为GPT

**解决方法：**
首先在win10安装界面 Shift+F10 调出控制台。

```shell
diskpart      # 进入DiskPart工具
list disk     # 查看电脑磁盘信息
select disk x # 选择需要分区操作的磁盘，x为磁盘编号。
clean         # 清理磁盘所有数据
convert gpt   # 转换为GPT分区表
```
