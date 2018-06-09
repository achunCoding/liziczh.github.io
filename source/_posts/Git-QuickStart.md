---
title: Git | QuickStart
comments: true
date: 2018-04-30 23:56:55
id: git-quickstart
tags: 
- git
categories: Git
toc: true
---

<!--# Git QuickStart-->

Git 分布式版本控制系统。

Git 特点：速度块，简单，完全分布式，高效管理，对非线性开发模式的强力支持。

Git 对待数据的方法是直接记录项目随时间改变的快照 ，而非差异比较。

<!--more-->

## 1. Git 配置

### 1.1 配置用户信息

```shell
# git配置用户名
$ git config --global user.name "username"
# git配置用户邮箱
$ git config --global user.email useremail@example.com
```

### 1.1 查看配置信息

```shell
$ git config --list
```

## 2. Git 本地仓库

### 2.1 创建本地仓库

将当前所在目录初始化新的本地仓库：

```shell
# git初始化本地仓库
$ git init
```

初始化完成，在当前目录下会出现一个名为 `.git` 的目录，所有 Git 需要的数据和资源都存放在这个目录中。

### 2.2 克隆远程仓库到本地

```shell
# 克隆远程仓库的默认分支
$ git clone <url>
# 克隆远程仓库的指定分支
$ git clone -b <branch-name> <url>
```

git支持多种数据传输协议：

- ssh协议：`user@server:/path.git`
- https协议： `http(s)://` 
- git协议： `git://` 

## 3. Git 文件状态


### 3.1 暂存更新

```shell
# 暂存更新
$ git add <file-name>
```

### 3.2 提交更新

```shell
# 提交已暂存更新
$ git commit -m "提交说明"
# 暂存并提交更新
$ git commit -am "提交说明"
```

### 3.3 查看仓库文件状态

```shell
# 查看仓库文件状态
$ git status
```

## 4. Git 远程仓库

### 4.1 添加远程仓库

```shell
# 添加一个远程仓库
$ git remote add <remote-name> <url>
```

### 4.2 移除远程仓库

```shell
# 移除某个远程仓库
$ git remote rm <remote-name>
```

### 4.3 重命名远程仓库

```shell
# 重命名远程仓库
$ git remote rename <old-name> <new-name>
```

### 4.4 查看远程仓库

```shell
# 查看所有远程仓库
$ git remote -v
```

### 4.5 从远程仓库抓取数据

```shell
# 从远程仓库抓取数据
$ git fetch <remote-name>
```

### 4.6 推送数据到远程仓库

```shell
# 推送数据到远程仓库
$ git push <remote-name> <branch-name>
```

## 5. Git 分支

Git 分支原理：分支指针指向不同版本；

Git 分支切换：HEAD 指针指向某个分支指针；

### 5.1 创建分支

```shell
# 创建一个分支
$ git branch <branch-name>
```

### 5.2 分支切换

```shell
# 分支切换
$ git checked <branch-name>
#  创建并切换到该分支
$ git checked -b <branch-name>
```

### 5.3 合并分支

```shell
# 合并分支
$ git merge <other-branch>
```

### 5.4 删除分支

```shell
# 删除分支
$ git branch -d <branch-name>
```

### 5.5 查看分支

```shell
# 查看所有分支
$ git branch -v
```

## 6. GitHub Fork

Fork：派生项目；GitHub 将在你的空间中创建一个完全属于你的项目副本，且你对其具有推送权限。

Fork 流程：

1. 从 master 分支中创建一个新分支
2. 提交一些修改来改进项目
3. 将这个分支推送到 GitHub 上
4. 创建一个合并请求
5. 讨论，根据实际情况继续修改
6. 项目的拥有者合并或关闭你的合并请求

## 7. gitignore

.gitignore文件规范：

- `#`：注释
- `!`：取反
- `*`：任意长度字符
- `?`：匹配单个字符
- `[abc]`：匹配方括号中的任意单个字符
- `[0-9]`：匹配两个字符之间的任意字符
- `**`：匹配任意中间目录
- 以`/`开头防止递归
- 以`/`结尾指定目录



> 参考资料：[GitBook](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%85%B3%E4%BA%8E%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)；
>

