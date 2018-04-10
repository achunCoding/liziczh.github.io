---
title: Notes-CSS
tags:
  - css
  - 学习笔记
categories: Web
comments: true
abbrlink: 53184
date: 2018-04-05 17:21:22
---

# CSS

CSS 层叠样式表（Cascading Style Sheets）

CSS主要通过为HTML元素增添样式以修饰静态页面，实现了内容与变现分离。

网页布局：div+CSS；

<!-- more -->

## CSS基础

### CSS三大特性

1. **层叠**性：权重高的样式会覆盖权重低的样式；
2. 继承性：子元素继承父元素的样式；
3. 优先级：作用域越小，优先级越大；
  - 不同级别：行内样式>id选择器>类选择器>标签选择器>通配符>继承；
  - 同一级别：后写的会覆盖先写的样式；

### CSS样式规则

CSS注释：`/* CSS注释内容 */`

```css
/* CSS注释内容 */
选择器{ 
	样式属性1:值1;
	样式属性2:值2;
}
```

### 引入CSS样式表

1.行内样式表（内联表）：`style="属性1:值1;属性2:值2;"`

2.内部样式表（内嵌表）

```css
  <style>
      选择器{ 
        样式属性1:值1;
        样式属性2:值2;
      }
  </style>
```
3.外部样式表（外联表）：外部**.css**文件

4.引入外部样式表：`<link rel="stylesheet" type="text/css" href="url" />`；

5.三种样式表总结

| 样式表     | 优点               | 缺点             | 使用情况     | 控制范围 |
| ---------- | ------------------ | ---------------- | ------------ | -------- |
| 行内样式表 | 权重高             | 样式与结构未分离 | 较少         | 单个标签 |
| 内部样式表 | 样式与结构部分分离 | 未彻底分离       | 较多         | 整个页面 |
| 外部样式表 | 样式与结构完全分离 | 需引入           | 多，**推荐** | 整个站点 |



## CSS样式

### CSS字体-font★

1. 字体系列：`font-family:"宋体","黑体"`；
   font-family是一个字体族的优先表，如果浏览器不支持第一个字体，则会尝试下一个。
2. 字体风格：`font-style:normal/italic/oblique`；
  - `normal`标准；
  - `italic`斜体；
  - `oblique`倾斜；
3. 字体粗细：`font-weight:400`；
  - 加粗度：`100`，`200`，`300`...`900`；
  - `normal`=`400 `；`blod`=`700`；
  - `bolder`更粗，`lighter`更细；
4. 字体大小：`font-size:px/em/%`；
5. font综合设置：` font : font-style font-weight font-size/line-height font-family`；
```css
注意：
- ！英文字体名一般不需要加引号，设置英文字体名必须位于中文字体名之前；
- ！加粗度没有单位，而且`x00`只有9个值，不存在`123`这种值；
- ！网页普遍是`14px`；尽量设偶数px，奇数px在IE6存在bug；
```

### CSS文本-text★
1. 文本缩进：`text-indent:em/px/%`；
2. 水平对齐：`text-align:left/center/right`；
3. 单词间隔：`word-spacing:em/px`；只适用于英文；
4. 字符间隔：`letter-spacin:em/px`；
5. 文本装饰：`text-decoration:none`；
  - `none`：标准文本
  - `underline`：文本下一条线
  - `overline`：文本上一条线
  - `line-through`：穿过文本下的一条线
  - `blink`：闪烁文本
6. 行高：`line-height:px`； 一般文本行高比字号大7-8像素即可。
7. 文本阴影：`text-shadow: 水平位置 垂直位置 模糊偏移 阴影颜色`；
8. 【CSS3】**颜色透明度**：`rgba(0~255, 0~255, 0~255, 0~1)`；

### CSS背景-background★
1. 背景色：`background-color：rgb()`；
2. 背景图：`background-image:url()`；
3. 背景平铺：`background-repeat:repeat/no-repeat`；
  - `repeat`：平铺
  - `no-repeat`：不平铺
  - `repeat-x`：横向平铺
  - `repeat-y`：纵向平铺
4. 背景定位：`background-position:Xpx Ypx`；
  - `Xpx Ypx`|`X% Y%`：位置信息
  - `top`，`bottom`，`center`，`left`，`right`；
  ！若只设了一个值，那么第二个值将是`center`；
5. 背景关联：`backgrount-attchment:fixed/scroll`；
  - `scroll`：默认值。背景图像会随着页面其余部分的滚动而移动；
  - `fixed`：图像固定；当页面的其余部分滚动时，背景图像不会移动；
6. 背景综合设置：`background: bg-color bg-image bg-repeat bg-attchment bg-position(x,y) `；
7. 【CSS3】背景尺寸：`background-size:contain/cover`；
  - `contain`：保证背景图片完整性；
  - `cover`：保证背景图片完全覆盖整个区域；
  - `width&height`：设置背景的宽&高；（一般设置1个参数，设置2个参数会导致图片变形）

### *CSS列表-list-style

1. 列表项标志：`list-style-type:none/disc/circle/square/decimal...`；
2. 列表项图像：`list-style-image:url()`；
3. 列表标志位置：`list-style-position:inside/outside`；
4. 列表综合设置：`list-style:image type position `；

### *CSS表格
1. 折叠边框：`border-collapse:collapse`；
2. 水平对齐：`text-align:left/center/right`；
3. 垂直对齐：`vertical-align:top/center/bottom`；
4. 空单元格显示/隐藏：`empty-cells:show/hide`；
5. 表格标题在上/在下：`caption-side:top/bottom`；

### *CSS轮廓-outline
1. 轮廓颜色：`outline-color:rgb()`；
2. 轮廓样式：`outline-style:solid/dotted/dashed/double`；详见[框模型-border]；
3. 轮廓宽度：`outline-width:thick/medium/thin/px`；
  - 粗`thick`；中`medium`；细`thin`；
4. 轮廓综合设置：`outline:color style width`；


### 标签显示模式★

- `display:none`：不显示；
- `display:block` ：块级元素；
- `display:inline` ：行内元素；
- `display:inline-block`： 行内块元素；

### 内容溢出盒子★

- `overflow:visible`：默认值。内容溢出部分显示在盒子外；
- `overflow:hidden`：隐藏内容溢出部分；
- `overflow:scroll`：内容溢出会被修剪，则浏览器会显示滚动条以便查看其余的内容；
- `overflow:auto`：如果内容溢出被修剪，则浏览器会显示滚动条以便查看其余的内容；



## CSS选择器

### 元素选择器
```css
标签{ 
	属性:值;
}
```

### 类选择器
```css
.类名{
	属性:值;
}
```
单类名调用：`class="类名"`；
多类名调用：`class="类名1 类名2 ..."`；

### id选择器
```css
#id{
	属性:值;
}
```

### 通配符选择器
```css
*{                
	属性:值;
}
```
> 作用域：整个HTML页面
>

### 交集选择器

```css
选择器1选择器2{
    属性:值;
}
```

### 并集选择器

```css
选择器1,选择器2{
    属性:值;
}
```

### 后代选择器★

```css
先代选择器 后代选择器{
    属性:值;
}
```
> 作用于先代元素内的[所有的后代元素]；

### 子元素选择器★

```css
父选择器 > 子选择器{
    属性:值;
}
```
> 只作用于父元素内的[直接子元素]；

### 相邻兄弟选择器

```
伯选择器 + 仲选择器{
    属性:值;
}
```
> 作用于**紧接在**伯元素后的[仲元素]；

### 属性选择器

```css
[属性]{
    属性:值;
}
```

```css
标签[属性=值]{
    属性:值;
}
```

### 伪类选择器
```css
选择器:伪类{
	属性:值;
}
```

**1.`<a>`链接伪类：**
- `a:link`：未访问的链接；
- `a:visited`：已访问的链接；
- `a:hover`：鼠标移动到链接；
- `a:active`：鼠标点击时的连接；

**2.位置结构伪类：**
- `first-child`：第一个子元素；
- `last-child`：最后一个子元素；
- `nth-child(n)`：第n个元素（n=1,2,3...）；
- `nth-last-child(n)`：倒数第n个元素（n=1,2,3...）;
  [n=`odd`：奇数 | n=`even`：偶数]
```css
注意：
- ！不是第一个HTML标签，而是第一个HTML元素
	html元素：文本，图像，链接；
```

**3.【CSS3】目标伪类：**
```css
/*:target 选择器用于选取当前活动的目标元素*/
:target{
    属性:值;
}
```
### 伪元素选择器

```css
标签::伪元素{
    属性:值;
}
```

**伪元素：**

- `first-line`：第一行；
- `first-letter`：第一个字符；
- `before`：在标签之前添加`content:新内容`；
  ```
  标签::before{
    content:新内容;
  }
  ```
- `after`：在标签之后添加`content:新内容`；
  ```
  标签::after{
    content:新内容;
  }
  ```
- `selection`：选中区域；




## CSS框模型（Box Model）★

![BoxModel](http://p6uturdzt.bkt.clouddn.com/lizi-CSS-boxmodel.gif)

### 边框-border
1. 边框宽度：`border-width:px`；
2. 边框样式：`border-style:solid/dashed/dotteddouble`；
  - `soild` 实线，`dashed` 虚线；
  - `dotted`点线，`double`双实线；
3. 边框颜色：`border-color:rgb()`；
4. 边框综合设置：`border:width style color`；
5. 单边边框：`border-top/right/bottom/left-属性:值`；
6. 圆角边框：`border-radius:半径px`；

### 内边距-padding
1. 内边距：`padding:top-px right-px bottom-px left-px `；
2. 单边内边距：`padding-top/right/bottom/left:值`；

### 外边距-margin
1. 外边距：`margin:top-px right-px bottom-px left-px`；
2. 单边外边距：`margin-top/right/bottom/left:值`；

```css
border/padding/margin综合设置提示：
- 可设置四个参数，分别对应top-right-bottom-left，顺时针遍历设置；
- 若只设置了1个value，则top=right=bottom=left=value；
- 若只设置了2个value，则top=val_1,right=val_2,bottom=val_1,left=val_2；顺时针遍历赋值；
- 若只设置了3个value，则top=val_1,right=val_2,bottom=val_3,left=val_1；顺时针遍历赋值；
- border-radius半径设置顺序：左上-右上-右下-坐下；顺时针遍历；
```


### 垂直外边距合并现象★
1. **相邻盒子**垂直外边距合并，margin合并取最大值；
解决方案：只设置一个margin；
2. **嵌套盒子**垂直外边距合并。
解决方案：`border`，`padding`，**`overflow:hidden`**；

### CSS3盒子&IE6盒子
- IE6框模型：`box-sizing:content-box`；
    ```css
    IE6框的大小：【width+左右padding+左右border+左右margin】
                ×【height+上下padding+上下border+上下margin】
    ```

- CSS3框模型：`box-sizing:border-box`；
    ```css
    CSS3框的大小：【width+左右margin】×【height+上下margin】
        - CSS3盒的[width&height]包含[padding+border]；
    ```



## 浮动

### 浮动-float（难点）
- **浮动：浮动块不在文档流中，不占文档流位置；但占浮动位置**。

- **浮动：`float:left/right`**；

  （未完待详细解释）

### 清除浮动-clear★
- clear 属性规定元素的哪一侧不允许其他浮动元素。
- 清除浮动：`clear:left/right/both`；

**清除浮动的方式：**
1. 【W3C推荐】在盒子末尾再添加一个如下的空盒子：
  `<div style="clear:both;"></div> `；
2. 在盒子样式中添加溢出隐藏样式：
  `overflow:hidden`；
3. 为盒子添加如下样式，在每次结束后都清除浮动：
  `.clearfix:after{clear:both}`只适用于IE6、IE7。



## 定位

### 定位简介（难点）

| position             | 是否占文档流   | 定位策略                   |
| -------------------- | -------------- | -------------------------- |
| `static`：静态定位   | 占文档流       |                            |
| `fixed`：固定定位    | 不占文档流     | 相对于视窗进行定位         |
| `relative`：相对定位 | 占文档流原位置 | 相对于原位置进行边偏移     |
| `absolute`：绝对定位 | 不占文档流     | 相对于其已定位的包含块定位 |

### 边偏移
1. 前提：float || position || 不占文档流；
2. 边偏移：`top`，`bottom`，`left`，`right`；

### 相对定位★
- `position:relative`；
1. 相对于在文档流中的原位置进行边偏移；
2. 仍占据文档流中的原位置；

![relative](http://p6uturdzt.bkt.clouddn.com/lizi-css-relative.gif)

### 绝对定位★
- `position:absolute`；
1. 相对于[**其已定位的包含块**]进行边偏移；
2. 已从**文档流**中**完全删除**，就好像该元素原来不存在一样；
3. 元素定位后生成一个**块级框**，而不论原来它在正常流中生成何种类型的框；
4. 绝对定位与文档流无关，所以可以覆盖在页面其他元素上；
5. 可通过`z-index`控制堆叠次序；`z-index` 仅能在定位元素上奏效；
6. 一般采取[子绝父相]策略；




## 页面日常开发习惯

页面布局：div+CSS；

使用外部样式表，引入外部.css文件；

例行设置：
1. 清除盒子内外边距：`*{padding:0;margin:0;}`；
2. 链接取消下划线：`a{text-decoration:none}`；
3. 列表取消列表项标志：`ul{list-style:none}`；

功能型样式：
- 外边距实现盒子水平居中：`margin:0 auto`；
- 垂直居中：`line-height:盒高`；
- 清除浮动：`<div style="clear:both;"></div> `；





## 附：

### CSS长度

| 相对长度单位 | 描述                           |
| ------------ | ------------------------------ |
| px           | 像素值                         |
| em           | 相对于当前字符的尺寸（自适应） |
| %            | 百分比                         |

| 绝对长度单位 | 描述               |
| ------------ | ------------------ |
| cm           | 厘米               |
| mm           | 毫米               |
| in           | 英寸               |
| pt           | 磅（1pt=1/72英寸） |

### CSS颜色

| 单位                   | 描述                             |
| ---------------------- | -------------------------------- |
| color_name             | 颜色名称（如red）                |
| rgb(0~255,0~255,0~255) | RGB值（如rgb(0,0,0)）            |
| rgb(x%,x%,x%)          | RGB百分比值（如rgb(100%,0%,0%)） |
| \#rrggbb               | 十六进制数（如#c3c3c3）          |



> 参考资料W3school：http://www.w3school.com.cn/css/index.asp