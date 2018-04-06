---
title: lizi-CSS学习笔记
date: 2018-04-05 17:21:22
tags:
- css
categories:
- Web
comments: false
---

## CSS

CSS：层叠样式表（Cascading Style Sheets）

### CSS三大特性

- 层叠性：之后的样式覆盖之前的样式
- 继承性：子标签继承父标签的样式属性
- 优先级：行内选择器>id选择器>类选择器>标签选择器

<!-- more -->

### CSS样式规则

CSS注释：`/* CSS注释内容 */`

```css
/* CSS注释内容 */
选择器{ 
	样式属性1:"值1";
	样式属性2:"值2";
}
```

### 引入CSS样式表

#### 行内样式表（内联表）

`style="属性1='值1';属性2='值2';"`

#### 内部样式表（内嵌表）

```css
<style>
	选择器{ 
		样式属性1:"值1";
		样式属性2:"值2";
	}
</style>
```

#### 外部样式表（外联表）

外部.css文件

#### 引入外部样式表

- `<link rel="stylesheet" type="text/css" href="CSS文件url" />`；

作用域越小，优先级越大；

### 标签显示模式

#### 块级元素



#### 行内元素



####行内块元素



#### 标签显示模式的转换

`display:block;` 块级显示

`display:inline;` 行内显示

`display:inline-block;` 行内块元素

### CSS字体样式-font

| font属性    | 值                                                           | 描述     |
| ----------- | ------------------------------------------------------------ | -------- |
| font-style  | normal 普通<br>italic 斜体<br>oblique 倾斜<br>unset 不设置   | 字体风格 |
| font-weight | 100<br>200<br>300<br>400 \| normal<br>500<br>600<br>700 \| blod<br>800<br>900 | 字体粗细 |
| font-size   | px；多用偶数，一般14px；<br> IE6"奇数px"有bug                | 字体大小 |
| font-family | family_name                                                  | 字体系列 |

- 字体设置：`selector{ font : font-style font-weight font-size/line-height font-family}`


### CSS外观属性

- 颜色
  1. 预定义色值：
  2. REX：`#000000`~`#FFFFFF`；
  3. RGB：`rgb(0-255,0-255,0-255)`；
- line-height：px；行间距，一般行高比字号大7-8像素即可
- text-indent：em；首行缩进：em指缩进字数，%指缩进比例
- word-spacing：em；单词间距，只适用于英文。
- letter-spacing：em；字符间距。
- text-align：文本水平对齐方式
- color: rgba(0~255, 0~255, 0~255, 0~1)：颜色透明度
- text-shadow: px px px #000000：阴影

### 基础选择器

#### 标签选择器

```css
标签{ 
	样式属性:"值";
}
```

#### 类选择器

##### 单类名选择器

```css
.类名{
	样式属性:"值";
}
```

调用：`class="类名"`

##### 多类名选择器

调用：`class="类名1 类名2 ..."`

层叠性：后面的样式覆盖前面的样式；

#### id选择器

```css
#id{
	样式属性:"值";
}
```

#### 通配符选择器

```css
*{                
	样式属性:"值";
}
```

作用域：整个HTML页面

#### 伪类选择器

```css
选择器:伪类{
	样式属性:"值";
}
```

##### 链接伪类

- link：未访问的链接；
- visited：已访问的链接；
- hover：鼠标移动到链接；
- active：鼠标点击时的连接；

##### 位置结构伪类

- first-child：第一个子元素；

- last-child：最后一个子元素；

- nth-child(n)：整数第n个，从1计数；

- nth-last-child(n)：倒数第n个，从1计数；

  （n=odd：奇数；n=even：偶数；）

##### 目标伪类

- target：


### 复合选择器

#### 交集选择器

```css
selector_1selector_2{
    样式属性:"值";
}
```

#### 并集选择器

```css
选择器1,选择器2{
    样式属性:"值";
}
```

#### 后代选择器★

```css
先代选择器 后代选择器{
    样式属性:"值";
}
```

作用于所有的[后代选择器]

#### 子元素选择器★

```css
父选择器 > 子选择器{
    样式属性:"值";
}
```

只作用于[直接子元素]

#### 属性选择器

```css
标签[属性]{
    样式属性:"值";
}
```

```css
标签[属性="属性值"]{
    样式属性:"值";
}
```

#### 伪元素选择器

```
标签::伪元素{
    样式属性:"值";
}
```

##### 伪元素

- first-letter：第一个字符
- first-line：第一行
- selection：选中区域
- before：在标签之前添加content="内容"
- after：在标签之后添加content="内容"

### CSS背景

background-color：rgb()

background-image：url();

background-repeat：

repeat平铺，no-repeat不平铺，repeat-x横向平铺，repeat-y纵向平铺

backgrount-attchment：fixed图像固定；scroll图像滚动

background-position：x||y;

参数：px，%，预定义值（center top bottom left right）

背景综合设置：background：bg-color bg-image bg-repeat bg-attchment bg-position(x,y) 

background-size：

width height;一般设置1个参数，设置2个参数会导致图片变形，

contain：保证图片完整

cover：保证覆盖整个区域

### 框模型（Box Model）
