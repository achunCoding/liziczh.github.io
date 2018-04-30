---
title: Git | 仓库管理
comments: true
date: 2018-04-30 23:56:55
id: git-primer
tags: 
- git
categories: Git
---

# Git仓库管理

Git版本控制系统

<!--more-->

## Git配置

### 用户信息

```shell
$ git config --global user.name "username"
$ git config --global user.email useremail@example.com
```

### 查看配置信息

```shell
$ git config --list
```



## Git本地仓库

### 创建本地仓库

在当前目录下初始化新的本地仓库，执行：

```shell
$ git init
```

初始化完成，在当前目录下会出现一个名为 `.git` 的目录，所有 Git 需要的数据和资源都存放在这个目录中。

### 克隆远程仓库到本地

```shell
$ git clone <url>
```

git支持的数据传输协议：ssh协议，https协议，git协议。
-ssh协议：`user@server:/path.git`
-https协议： `http(s)://` 
-git协议： `git://` 

## Git文件状态

untracked-->unmodified-->modified-->staged

### 检查当前文件状态

```shell
$ git status
```

### 暂存更新

```shell
$ git add <file-name>
```

### 提交更新

```shell
$ git commit  -m "提交说明"
```

```shell
git commit -a  # git add + git commit
```



## 远程仓库

### 添加远程仓库关联

```shell
$ git remote add <remote-name> <url>
```

### 移除远程仓库关联

```shell
$ git remote rm <old-name> <new-name>
```

### 查看当前添加的远程仓库

```shell
$ git remote -v
```

### 从远程仓库抓取数据

```shell
$ git fetch <remote-name>
```

### 推送数据到远程仓库

```shell
$ git push <remote-name> <branch-name>
```


