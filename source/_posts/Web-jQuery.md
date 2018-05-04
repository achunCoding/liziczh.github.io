---
title: Web | jQuery
id: web-jquery
comments: true
tags:
  - jquery
categories: Web
date: 2018-04-09 16:34:00
---

<!--# jQuery-->

jQuery是一个JavaScript函数库，对JS功能实现封装成了函数，极大地简化了JavaScript编程。

jQuery库特性：

- HTML 元素选取
- HTML 元素操作
- CSS 操作
- HTML 事件函数
- JavaScript 特效和动画
- HTML DOM 遍历和修改
- AJAX
- Utilities

<!--more-->

# 引入jQuery

## jQuery版本

jQuery版本：
- jQuery1.x.x：兼容IE6/7/8低级浏览器。
- jQuery2.x.x：不兼容IE6/7/8。
- jQuery3.x.x：全面支持HTML5和CSS3。

jQuery版本分类：
- Development version：[jquery.js] 开发版，未压缩，用于测试和开发。
- Production version：[jquery.min.js] 精简版，已被压缩。



## 引入jQuery

```html
<head>
	<script type="text/javascript" src="js//jquery-1.12.4.js"</script>
</head>
```

# jQuery起步

## jQuery入口函数

第一种写法：

```js
$(document).ready(function(){
    jQuery代码
});
```

第二种写法：

```js
$(function(){
    jQuery代码
});
```

**jQuery入口函数与JS入口函数的区别**：
①jQuery的入口函数只等待DOM树加载完即执行；
②JS入口函数需要等待所有资源加载完成再执行；

## jQuery对象与DOM对象的转换

jQuery简化了JS编程，大部分JS效果实现都被封装成了函数，而调用这些jQuery函数必须使用jQuery对象。

```js
var $jQueryObj = $(DOMObj);
var DOMObj = $jQueryObj[0];
var DOMObj = $jQueryObj.get(0);
```

> jQuery对象命名一般以$为前缀

## jQuery基础语法

```javascript
$("选择器").操作函数()
```

`$()`：即jQuery()，本质是一个函数。

# jQuery选择器

jQuery选择器：获取元素

## 元素选择器

| 元素选择器 | 描述         |
| ---------- | ------------ |
| `*`        | 通配符选择器 |
| `#id`      | id选择器     |
| `.class`   | 类选择器     |
| `element`  | 元素选择器   |
| `s1s2`     | 交集选择器   |
| `s1,s2`    | 并集选择器   |
| `s1 s2`    | 后代选择器   |
| `s1 > s2`  | 子元素选择器 |

## 属性选择器

| 属性选择器      | 描述                    |
| --------------- | ----------------------- |
| `[attr]`        | 属性选择器              |
| `[attr=value]`  | 属性=值的元素           |
| `[attr!=value]` | 属性!=值的元素          |
| `[attr$=value]` | 属性值以value结尾的元素 |

## 过滤选择器

| 位置     | 描述         |
| -------- | ------------ |
| `:first` | 第一个元素   |
| `:last`  | 第二个元素   |
| `:odd`   | 所有奇数元素 |
| `:even`  | 所有偶数元素 |

| 索引位置     | 描述                               |
| ------------ | ---------------------------------- |
| `:eq(index)` | 指定索引的元素<br>（index从0开始） |
| `:gt(num)`   | 所有索引>num的元素                 |
| `:lt(num)`   | 所有索引<num的元素                 |

| 标签类型    | 描述         |
| ----------- | ------------ |
| `:header`   | 所有标题元素 |
| `:animated` | 所有动画元素 |

| 元素状态          | 描述               |
| ----------------- | ------------------ |
| `:contains(text)` | 包含指定文本的元素 |
| `:empty`          | 无子节点的元素     |
| `:hidden`         | 所有隐藏的元素     |
| `:visible`        | 所有可见的元素     |

## 表单选择器

| 表单元素    | 描述                                 |
| ----------- | ------------------------------------ |
| `:input`    | 所有`<input>`元素                    |
| `:text`     | 所有`type="text"`的 `<input>` 元素   |
| `:password` | 所有`type="password"`的`<input>`元素 |
| `:radio`    | 所有`type="radio"`的`<input>`元素    |
| `:checkbox` | 所有`type="checkbox"`的`<input>`元素 |
| `:submit`   | 所有`type="submit"`的`<input>`元素   |
| `:reset`    | 所有`type="reset"`的`<input>`元素    |
| `:button`   | 所有type="button"的`<input>`元素     |
| `:image`    | 所有type="image"的`<input>`元素      |
| `:file`     | 所有`type="file"`的`<input>`元素     |
| `:enable`   | 所有激活的`<input>`元素              |
| `:disabled` | 所有禁用的`<input>`元素              |
| `:selected` | 所有被选取的`<input>`元素            |
| `:checked`  | 所有被选中的`<input>`元素            |

# jQueryDOM★

## DOM操作★

### DOM 元素内容

**1.text()**：设置/获取**所选元素的文本内容**

```js
$("selector").text();  // 获取文本内容
$("selector").text("文本内容");  // 设置文本内容
```

**2.html()**：设置/获取**所选元素的内容**

```js
$("selector").html();  // 获取HTML内容
$("selector").html("HTML代码");  //设置 HTML内容
```

**3.val()**：设置/获取**表单字段的值**

```js
$("selector").val();  // 获取表单字段的值
$("selector").val("表单字段值");  // 设置表单字段的值
```

### DOM HTML属性

**attr()**：HTML**自定义属性值**

```js
$("selector").attr("属性名");  // 获取HTML属性
$("selector").attr("属性名", "值");  // 设置HTML属性
```



### 回调函数



### DOM 插入元素

**1.append()**：在被选元素的结尾追加内容

```js
$("selector").append("插入内容");
```

**2.prepend()**：在被选元素的开头插入内容

```js
$("selector").prepend("插入内容");
```

**3.before()**：在被选元素之前插入内容

```js
$("selector").before("插入内容");
```

**4.after()**：在被选元素之后插入内容

```js
$("selector").after("插入内容");
```

### DOM 删除元素

**1.remove()**：删除被选元素及其子元素

```js
$("selector").remove();
```

**2.empty()**：删除被选元素的所有子元素

```js
$("selector").empty();
```

### DOM CSS类

**1.addClass()**：向被选元素添加一个或多个样式类

```js
$("selector").addClass("类名");
```

**2.removeClass()**：从被选元素移除一个或多个类

```js
$("selector").removeClass("类名");
```

**3.toggleClass()**：对被选元素进行类切换（本质是类的添加/删除）

```js
$("selector").toggleClass("类名");
```

**4.hasClass()**：判断被选元素是否存在类

```js
$("selector").hasClass("类名");
```

### DOM CSS属性

**1.css()**：设置或返回样式属性

```js
$("selector").css("样式属性");       // 获取样式属性值
$("selector").css("样式属性","值");  // 设置样式属性
$("selector").css({"样式属性":"值","样式属性":"值",...});  // 设置多个样式属性
```

### DOM 元素宽高

**1.width()**：设置或返回元素的宽度（不包括内边距、边框、外边距）

```js
$("selector").width();
```

**2.height()**：设置或返回元素的高度（不包括内边距、边框、外边距）

```js
$("selector").height();
```

**3.innerWidth()**：返回元素的宽度（包括内边距）

```js
$("selector").innerWidth(); 
```

**4.innerHeight()**：返回元素的高度（包括内边距）

```js
$("selector").innerHeight();
```

**5.outerWidth()**：返回元素的宽度（包括内边距、边框）

```js
$("selector").outerWidth();
```

**6.outerHeight()**：返回元素的高度（包括内边距、边框）

```js
$("selector").outerHeight();
```

**7.outerWidth(true)**：返回元素的宽度（包括内边距、边框和外边距）

```js
$("selector").outerWidth(true);
```

**8.outerHeight(true)**：返回元素的高度（包括内边距、边框和外边距）

```js
$("selector").outerHeight(true);
```

## DOM 遍历★

### 向上遍历-祖先

**1.parent()**：返回被选元素的直接父元素

```js
$("selector").parent("筛选选择器");  // 直接父元素，可筛选
```

**2.parents()**：返回被选元素的所有祖先元素，向上遍历直到根`<html>`

```js
$("selector").parents("筛选选择器");  // 所有祖先元素，可筛选
```

**3.parentsUntil()**：返回介于两个给定元素之间的所有祖先元素

```js
$("selector1").parentsUntil("selector2"); 
```

### 向下遍历-后代

**1.children()**：返回被选元素的所有直接子元素

```js
$("selector").children("筛选选择器");  // 返回直接子元素，可筛选
```

**2.find()**：返回被选元素的所有后代元素

```js
$("selector").find("筛选选择器"); // 返回后代元素，可筛选
```

### 水平遍历-同胞

**1.siblings()**：返回被选元素的所有同胞元素

```js
$("selector").siblings("筛选选择器");  // 返回所有同胞元素，可筛选
```

**2.next()**：返回被选元素的下一个同胞元素

```js
$("selector").next("筛选选择器");  // 返回下一个同胞元素，可筛选
```

**3.nextAll()**：返回被选元素之后的同胞元素

```js
$("selector").nextAll("筛选选择器");  // 返回元素之后的同胞元素，可筛选
```

**4.nextUntil()**：返回介于两个给定元素之间的所有同胞元素

```js
$("selector1").nextUntil("selector2");  // 从selector1水平向后遍历直到selector2
```

**5.prev()**：返回被选元素的上一个同胞元素

```js
$("selector").prev("筛选选择器");  // 返回上一个同胞元素，可筛选
```

**6.prevAll()**：返回被选元素之前的同胞元素

```js
$("selector").prevAll("筛选选择器");  // 返回元素之前的同胞元素，可筛选
```

**7.prevUntil()**：返回介于两个给定元素之间的所有同胞元素

```js
$("selector1").prevUntil("selector2");  // 从selector1水平向前遍历直到selector2
```

### 元素过滤

**1.eq()**：返回被选元素中带有指定索引的元素

```js
$("selector").eq(index);  // 返回指定索引的元素
```

**2.filter()**：返回匹配筛选标准的元素

```js
$("selector").filter("筛选选择器");  // 返回匹配筛选选择器的元素
```

**3.not()**：返回不匹配筛选标准的元素

```js
$("selector").not("筛选选择器");  // 返回不匹配筛选选择器的元素
```

# jQuery事件



# jQuery效果

## 隐藏/显示

**1.show()**：显示

```js
 $("selector").show(speed,callback);
```

**2.hide()**：隐藏

```js
 $("selector").hide(speed,callback);
```

**3.toggle()**：切换hide()/show()

```js
$("selector").toggle(speed,callback)
```

> speed：速度
> callback：函数完成后要执行的函数

##  淡入/淡出

**1.fadeIn()**：淡入已隐藏的元素

```js
$("selector").fadeIn(speed,callback);
```

**2.fadeOut()**：淡出已显示的元素

```js
$("selector").fadeIn(speed,callback);
```

**3.fadeToggle()**：切换fadeIn()和fadeOut()

```js
$("selector").fadeToggle(speed,callback);
```

**4.fadeTo()**：允许渐变为给定的不透明度

```js
$("selector").fadeTo(speed,opacity,callback);
```

> speed：速度
> opacity：不透明度（0~1）
> callback：函数完成后要执行的函数
>

## 滑动

**1.slideDown()**：向下滑动元素

```js
$("selector").slideDown(speed,callback);
```

**2.slideUp()**：向上滑动元素

```js
$("selector").slideUp(speed,callback);
```

**3.slideToggle()**：切换slideDown()和slideUp()

```js
$("selector").slideToggle(speed,callback);
```

## 自定义动画

**animate()**：

```js
$("selector").animate({params},speed,callback);
```

> params：定义形成动画的CSS属性，[必要参数]
> speed：速度
> callback：函数完成后要执行的函数
>







# jQuery应用Ajax



