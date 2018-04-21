---
title: Hexo系列 | （三）URL优化及站点提交
id: hexo-submit
comments: true
date: 2018-04-21 19:01:32
tags:
- hexo
categories: Hexo
---

<!--# Hexo系列 | （三）URL优化及站点提交-->

在博客站点搭建完毕之后，搜索引擎仍然无法搜索到我们的博客，所以我们需要将自己的站点提交给搜索引擎，让网络爬虫常来我们的站点。
首先我们需要优化一下自己网站的URL，方便爬虫爬取。然后再提交站点。

<!--more-->

## URL优化

一个好的URL设计，不仅有利于网络爬虫的爬取，更有利于用户的体验。
正确的URL设计应该满足：长度尽量短，目录层次尽量少，全小写，连字符使用中划线`-`，具有描述性，包含关键词等。

**URL优化策略（一）**：自定义id属性

1.为每篇文章Front-matter添加id属性，作为文章URL，确保id属性的值满足以上条件。
2.编辑站点配置文件：

```yaml
# permalink: :year/:month/:day/:title.html  # 默认永久链接冗长，title中存在中文字符。
permalink: :id.html # 尽量短，层次少，全小写，中划线连字，具有描述性，包含关键词
```

**URL优化策略（二）**：abbrlink链接唯一化

1.安装abbrlink插件：

```shell
npm install hexo-abbrlink --save  
```

2.编辑站点配置文件：

```yaml
permalink: :abbrlink.html   # 生成唯一链接
abbrlink:
  alg: crc32  # 算法：crc16(default) and crc32
  rep: dec    # 进制：dec(default) and hex
```

## 站点提交

本篇以百度站点提交为例。

### **1.验证是否被百度收录**

打开百度，输入`site:<域名>`，验证是否被百度收录。

```
site:example.com
```

### **2.链接提交**

若未被收录，点击“提交网址”。登录[百度站长平台](https://ziyuan.baidu.com/linksubmit/url)，链接提交，输入`<域名>`。
注意：不要输入github.io的域名，github不允许百度爬虫爬取。

### **3.验证网站所有权**

验证方式有三种 ：文件验证、HTML标签验证和CNAME验证，任选一种验证成功即可。

(1)文件验证：
下载验证文件，一个存放着token的html文件。
将验证文件置于网站根目录下（blog/source/或者theme/next/）。

(2)HTML标签验证：
将以下代码添加到你的网站首页HTML代码的`<head></head>`中

```html
<mate name="baidu-site-verification" content="你的token">
```

(3)CNAME验证：
如果你绑定了自己的域名，只需添加一条CNAME域名解析记录：

| 记录类型 | 主机记录  | 记录值           |
| -------- | --------- | ---------------- |
| CNAME    | 你的token | ziyuan.baidu.com |

推荐使用**CNAME验证**或**文件验证**。

为使您的网站一直保持验证通过的状态，请保留验证的文件、html标签或CNAME记录，百度可能会去定期检查验证记录。

### **4.生成网站地图**

编辑站点配置文件，确保url是你的域名地址：

```yaml
url: https://<你的域名>
```

安装sitemap插件：

```shell
npm install hexo-generator-sitemap --save   # 安装谷歌站点地图插件
npm install hexo-generator-baidu-sitemap --save  # 安装百度站点地图插件
hexo generate  # 生成sitemap.xml和baidusitemap.xml
```

### 5.链接提交方式

> 如何选择链接提交方式？
> ①主动推送：最为快速的提交方式，推荐您将站点当天新产出链接立即通过此方式推送给百度，以保证新链接可以及时被百度收录。
> ②自动推送：最为便捷的提交方式，请将自动推送的JS代码部署在站点的每一个页面源代码中，部署代码的页面在每次被浏览时，链接会被自动推送给百度。可以与主动推送配合使用。
> ③sitemap：您可以定期将网站链接放到sitemap中，然后将sitemap提交给百度。百度会周期性的抓取检查您提交的sitemap，对其中的链接进行处理，但收录速度慢于主动推送。
> ④手动提交：一次性提交链接给百度，可以使用此种方式。
>
> 效率：主动推送>自动推送>sitemap

**主动推送**：

1.安装百度提交插件：

```shell
npm install hexo-baidu-url-submit --save
```

2.编辑站点配置文件，配置以下信息：

```yaml
baidu_url_submit:
  count: 3  # 比如3，代表提交最新的三个链接
  host: <域名>  # 你所提交的域名
  token: yourtoken # 秘钥，请不要发布在公众仓库中
  path: baidu_urls.txt # 文本文档路径，新链接会保存在此文本文档中
```

3.编辑站点配置文件，为deploy新增一个type：

```yaml
deploy:
	-type: baidu_url_submitter  # 为deploy新增一个type
```

**自动推送**：

若主题已经集成了自动推送的JS代码，直接编辑next主题配置文件：

```yaml
baidu_push: true  # 将百度推送置true
```

如果主题没有集成自动推送的JS代码，参考类似于以下路径，插入head文件中。

```
blog\themes\你的主题\layout\_partial\head.ejs
```

推送之后，大概一个礼拜左右，百度就会收录你的站点了。