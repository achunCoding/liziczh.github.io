---
title: Hexo系列 | （四）多机同步更新博客
comments: true
date: 2018-04-21 22:00:07
id: hexo-multimachine
tags:
- hexo
categories: Hexo
---

<!--# Hexo系列 | （四）多机同步更新博客-->

Hexo博客存在一个问题：如果存储blog文件的电脑系统崩溃了，又或者我们正在使用其他电脑，我们便无法再发布或更新博客了。
如果选择重新搭建的话，不仅过程繁琐，而且还需要大量时间安装依赖、主题配置、博客优化，极其麻烦。
所以我们采取的策略是：一个仓库两个分支。仓库即[yourname.github.io]，一个分支[master]用于托管演示页面，一个分支[hexo]用于保存Hexo博客站点的必要文件。

<!-- more -->

## 多机同步更新的前提：hexo分支

Hexo博客站点的必要文件：

```yaml
.
├── scaffolds    # 文章模板
├── source       # 用户源文件：页面，文章markdown文件
├── themes       # 主题
├── .gitignore   # git忽略文件信息
├── _config.yml  # 站点配置文件
├── package.json # 已安装插件映射表，下次只需npm install即直接安装表中的插件
├── package-lock.json
```

编辑**站点根目录**下的`.gitignore`文件，使Git上传时忽略不必要的文件：

```
.DS_Store
Thumbs.db
db.json
*.log
node_modules/
public/
.deploy*/
```

1.删除`themes\next`中的`.git`，`.github`，`.gitignore`等Git仓库文件，只保留站点根目录下的`.gitignore`。

2.在Hexo博客站点根目录（即blog文件夹）中GitBash：

```shell
git init
git checkout -b hexo
git add .
git commit -m "提交说明"
git push origin hexo
```



## 多机同步更新博客

### 安装前提

1.安装Git
2.安装nodejs
3.配置SSH协议

### 博客还原

```shell
# 克隆hexo分支到本地
git clone -b hexo https://github.com/yourname/yourname.github.io.git 
cd yourname.github.io # 进入yourname.github.io文件夹
npm install # 安装依赖，根据package.json自动安装之前安装过的插件
npm install hexo-cli -g  # 安装hexo命令行模式
hexo init  # hexo初始化
```

### 正常使用

重新部署：

```shell
hexo clean
hexo g -d
```

上传至hexo分支：

```shell
git add .
git commit -m "提交说明"
git push origin hexo
```