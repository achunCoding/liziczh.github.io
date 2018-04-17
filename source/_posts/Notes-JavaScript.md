---
title: Notes | JavaScript
comments: true
tags:
- notes
- js
categories: Web
abbrlink: a60fad27
date: 2018-04-07 14:27:12
---

# JavaScript

JavaScript 网络脚本语言，常用来为网页添加动态功能，与用户交互。
JavaScript是一门轻量级，解释型，基于原型，面向对象，弱类型的网络脚本语言。
- 解释型：无需编译，在程序运行中逐行进行解释执行。
- 弱类型：对使用的数据类型不严格要求。
- 面向对象：JS基本对象，DOM对象，BOM对象。
- 跨平台：不依赖于操作系统，仅需要浏览器的支持。

<!-- more -->

# JS基础

## JS使用方式

1.行内js：

```html
<input type="button" value="js" onclick="javascript:alert('hello')" />
```

2.内部js：

```html
<script>
	js代码
</script>
```

3.外部js：外部js文件

4.引入外部js文件：

```html
<!--引入外部js-->
<script type="text/javascript" src="js/index.js"></script>
```

## JS注释

1.单行注释：

```js
// 单行注释
```

2.多行注释：

```js
/*
 多行注释
 */
```

## JS输出语句

```js
alert();           //弹出框输出
console.log();     //在console显示
document.write();  //写入HTML文件中
```
## JS标识符

JS**标识符命名**规则：
①见名知意
②驼峰命名法：首个单词全小写，之后的单词首字母大写。
③`abc123_$`
④不能以数字开头
⑤不能使用关键字
⑥严格区分大小写

## JS变量

### 变量声明

JS是弱类型的，无需明确的变量声明，同一个变量可以存放不同类型的值。

**1.**JS使用**`var`**声明变量：

```js
var a = 3;  //JS使用var声明变量
```

**2.**JS**直接使用标识符**声明变量：

```js
x = 4;  //JS直接使用标识符声明变量，全局变量； 
```

### 变量作用域

| 变量类型 | 描述                                |
| -------- | ----------------------------------- |
| 全局变量 | 定义在函数外的var变量  &  无var变量 |
| 局部变量 | 定义在函数内的var变量               |

### 变量提升★

**变量提升（Hoisting）**：JS函数及变量的声明都将被提升到函数的最顶部。



## JS数据类型

JS是一种弱类型语言（动态类型），同一个变量可存放不同类型的值。

**typeof操作符**：检测变量数据类型；

```js
typeof 3.14       //number 数字
typeof NaN        //number 数字
typeof '123'      //string 字符串
typeof true       //boolean 布尔值
typeof undefined  //undefined 未赋值变量
typeof null       //object 空对象引用
typeof {}         //object 对象
typeof []         //object 数组对象
typeof alert()    //function 函数
```
### 原始类型

**1.Number | 数字**：

```js
3;      // 整数
3.4;    // 浮点数
123e5;  // 科学计数法
0xFFFF; // 十六进制数
NaN;    // 非数字，任何涉及NaN的计算，都返回NaN。
```

**2.String | 字符串**：

```js
"abc";  // 双引号字符串
'abc';  // 单引号字符串
"\r\n"; // 转义字符
```

| 转义字符 | 描述 |
| -------- | ---- |
| `\n`     | 换行 |
| `\r`     | 回车 |
| `\t`     | 制表 |
| `\b`     | 退格 |
| `\'`     | `'`  |
| `\"`     | `"`  |
| `\\`     | `\`  |

**3.Boolean | 布尔型**：

```js
true;  // true值
false; // false值
```

**4.Undefined | 未赋值变量**：

```js
undefined; // 意为"缺少值"，未赋值的变量;（用于变量类型）
```

**5.Null | 空指针**：

```js
null; // 空对象指针，（用于对象类型）
/* typeof null，类型为Object; */
```

**-区分undefined和null★**：

```js
number(null)==0
number(undefined)==NaN;
/* 目前null与undefined基本同义 */
```

### 类型转换

1.转换成字符串：

```js
.toString(); // null,undefined没有toString()
```

2.转换成数字：

```js
.parseInt("123red",10);   // 返回123，逐个字符判断
.parseFloat("1.2.3",10);  // 返回1.2，逐个字符判断
```

**强制类型转换**：

**1.Number()**：

```js
Number(1.2)   // 1.2
Number(1.2.3) // NaN
Number(false) // 0
Number(true)  // 1 
Number(undefined) // NaN
Number(null)  // 0
Number(new object()) // NaN
```

**2.String()**：

```js
String();   // 转换任意数据类型
String(null); // "null"
String(undefined); // "undefined"
```

**3.Boolean()**：

```js
/* false：空字符串，0，undefined，null */
Boolean("");        //false：空字符串
Boolean(0);	        //false：0
Boolean(undefined); //false：undefined
Boolean(null);      //false：null
Boolean(new object()); //true - 对象
```

### 引用类型

引用类型：对象，一组属性和方法的集合。

**1.Object | 对象**：{}

```js
var obj = {
	var name = "张三";
	var age = 20;
	var eat = function(){
        alert(this.name + "正在吃饭~");
	}
};
```

```js
var obj = new Object();  // Object对象
```

**2.Array | 数组**：[]

```js
var arr = [1,2,3];  // 字面量
```

```js
var arr = new Array(1,2,3);  //数组对象
```

**3.Function | 函数**：

```js
function f(){}  // 一般函数声明
```

```js
var f = function(){}  // 函数表达式
```

```js
var f = new Function(arg1, arg2, ..., argN, function_body) // 函数对象
```

更多引用类型：String，Boolean，Number，Math，Date，RegExp，Error，EvalError，RangeError，ReferenceError，SyntaxError，TypeError，URIError。

## JS运算符

1.算术运算符：`+`，`-`，`*`，`/`，`%`，`++`，`--`
2.关系运算符：`>`，`<`，`>=`，`<=`，`==`，`!=`
3.逻辑运算符：`&`，`|`，`~`，`^`，`!`，`&&`，`||`
4.位运算符：`<<`，`>>`，`>>>`，`~`，`&`，`|`，`^`
5.赋值运算符：`=`，`+=`，`-=`，`*=`，`/=`，`%=`
6.条件运算符：`a?b:c `

### 双等与三等★

`==`&`!=`：只比较值，不比较类型。
`===`&`!==`：既比较值，也比较类型。

## JS语句

### 判断语句

**if语句**：

```js
if(条件表达式){
    条件为true执行语句;
}else{
    条件为false执行语句;
}
```

**switch语句**：

```js
switch(n)
{
case 1:
  执行代码块 1
  break;
case 2:
  执行代码块 2
  break;
default:
  与以上case值不同时执行的代码
}
```

### 循环语句

**while循环**：

```js
var i = 0;
while(i<10){
	循环体;
	i++;
}
```

**do while循环**：

```js
// 先执行一次后判断
var i = 0;
do{
	循环体;
    i++;
}while(i<10);
```

**for循环**：

```js
for(var i = 0;i<10;i++){
	循环体;
}
```

**for-in循环**：

```js
for(var i in 对象){
    循环体;
}
```

### 跳转语句

| 跳转语句 | 描述                         |
| -------- | ---------------------------- |
| break    | 跳出当前循环，跳出一层循环； |
| continue | 跳出本次循环，进行下次循环； |
| return   | 结束整个方法；               |

## JS字符串

JS字符串本质是一个不可变的字符数组。

### 创建字符串

**1.**使用**字面量**创建字符串：

```js
var str = "abc";  // 字面量
```

**2.**使用**String对象**创建字符串：

```js
var str = new String("abc"); // String对象
```

### 字符串拼接

```js
var str = "abc"+"def";  // 使用“+”拼接字符串
```

### String对象

| string属性&方法                | 描述                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| length                         | 返回字符串长度                                               |
| charAt(number)                 | 返回指定索引位置的字符                                       |
| charCodeAt()                   | 返回指定索引位置字符的 Unicode 值                            |
| concat()                       | 连接字符串                                                   |
| substring()                    | 提取字符串中两个指定的索引号之间的字符                       |
| substr()                       | 从起始索引号提取字符串中指定数目的字符                       |
| slice()                        | 提取字符串片断，并在新字符串中返回被提取部分                 |
| indexOf()                      | 返回字符串中检索指定字符第一次出现的位置<br>如果没有返回-1   |
| lastIndexOf()                  | 返回字符串中检索指定字符最后一次出现的位置<br>如果没有返回-1 |
| trim()                         | 移除字符串首尾空格                                           |
| toUpperCase()<br>toLowerCase() | 大小写转换                                                   |
| localeCompare()                | 比较两个字符串大小                                           |
| match()                        | 找到一个或多个正则表达式的匹配                               |
| search()                       | 检索与正则表达式相匹配的值，返回位置                         |
| replace()                      | 替换与正则表达式匹配的子串                                   |
| split()                        | 把字符串分割为子字符串数组                                   |

## JS数组

JS数组是动态数组，无需指定长度。
JS是弱类型的，数组中可以有不同的变量类型。

### 创建数组

**1.**使用**字面量**创建：

```js
var arr=["a","b","c"];  // 字面量
```

**2.**使用**Array**创建：

```js
var arr=new Array("a","b","c");  // Array对象
```

### 遍历数组

**1.**使用**普通for循环**遍历：

```js
for(var i = 0 ; i < arr.length ; i++){
    console.log(arr[i]);
}
```

**2.**使用**for-each**遍历：

```js
for(var i in arr){
    console.log(arr[i]);
}
```

### Array对象

| Array方法     | 描述                                                      |
| ------------- | --------------------------------------------------------- |
| length        | 返回数组长度                                              |
| isArray()     | 判断是否为数组                                            |
| valueOf()     | 返回数组对象的原始值                                      |
| toString()    | 将数组以字符串的形式返回                                  |
| push()        | 向数组末尾追加元素，返回新的长度                          |
| pop()         | 删除并返回数组的最后一个元素                              |
| join()        | 将数组转换为字符串，默认按逗号隔开                        |
| shift()       | 删除并返回数组的第一个元素                                |
| unshift()     | 向数组的开头追加元素，返回新的长度                        |
| reverse()     | 数组反转                                                  |
| slice()       | 从某个已有的数组返回选定的元素                            |
| splice()      | 删除元素，并向数组添加新元素                              |
| sort()        | 排序；<br>数字按大小排，字母按字典顺序排，汉字按Unicode排 |
| indexOf()     | 返回元素索引                                              |
| lastIndexOf() | 返回元素反序索引                                          |

## JS函数

JS函数是一种数据类型[function]，JS函数也是对象。

### 函数定义

**1.**使用**函数声明**定义：

```js
function 函数名(arg0, arg1, ... argN){}  // 函数声明
```

**2.**使用**函数表达式**定义：

```js
var 函数名 = function(arg0, arg1, ... argN){}  // 函数表达式 | 匿名函数
```

**3.**使用**构造函数**定义：

```js
var function_name = new Function(arg1, arg2, ..., argN, function_body)
```

**4.自执行函数**：自己调用自己

```js
(function 函数名([形参]){
    函数体;
})([实参]);
```

### 函数提升★

**一等公民**：JS函数与JS变量处于同等地位，可作为一个值使用。
①将函数赋值给变量
②将函数赋值给对象的属性
③将函数作为参数出入其他函数
④将函数作为返回结果

**函数提升（Hoisting）**：JS函数及变量的声明都将被提升到函数的最顶部。

### Function对象

1.JS函数实际上是功能完整的对象。

| function属性&方法 | 描述                                             |
| ----------------- | ------------------------------------------------ |
| eval("JS代码") | 计算 JavaScript 字符串，并把它作为脚本代码来执行 |
| escape()          | 对字符串进行编码                                 |
| unescape()          | 对字符串进行解码                                |
| encodeURI()       | 把字符串编码为 URI                               |
| decodeURI()       | 解码某个编码的 URI                               |
| isNaN()           | 判断是否是非数字                                 |
| Number()          | 把对象转换为数字                                 |
| String()          | 把对象转换为字符串                               |
| parseInt()        | 解析一个字符串并返回一个整数                     |
| parseFloat()      | 解析一个字符串并返回一个浮点数                   |

2.JS函数不会重载，只会执行最后一个函数。

```js
var doAdd = new Function("num", "alert(num + 20)");
var doAdd = new Function("num", "alert(num + 10)");
doAdd(1);  // 返回11
```

### arguments对象

JS函数内置对象：arguments对象，表示函数调用的参数数组。

1.检测参数个数：

```js
arguments.length  // 参数数组长度，参数个数
```

2.模拟函数重载：
使用`arguments.length`判断传递给函数的参数个数，即可模拟重载。

```js
function doAdd() {
  if(arguments.length == 1) {
    alert(arguments[0] + 1);
  } else if(arguments.length == 2) {
    alert(arguments[0] + arguments[1]);
  }
}
doAdd(10);    // 返回11
doAdd(10,20); // 返回30
```

### JS闭包★

**闭包（closure）**指的是词法表示包括不被计算的变量的函数，即函数可以使用函数之外定义的变量。

```js
// 闭包实例
var iBaseNum = 10;
function addNum(iNum1, iNum2) {
	function doAdd() {
		return iNum1 + iNum2 + iBaseNum;
		// 内部函数作为闭包，获取外部函数的参数iNum1、iNum2，以及全局变量iBaseNum。
  	}	// doAdd()函数根本不接受参数，它使用的值是从执行环境中获取的。
  return doAdd(); 
}
```

## JS对象

### Object对象

```js
/* Object属性 */
obj.constructor // 指向对象构造器
obj.prototype // 指向对象原型
/* Object方法 */
Object.assign({}, obj) // 对象复制
Object.assign(obj1, obj2, obj3) // 对象合并
Object.create(proto, [prop_Object]) // 模拟类（class）
Object.is(obj1, obj2) //判断两个值是否相同
Object.keys() // 返回对象所有属性组成的数组
Object.delete(obj.prop) // 删除对象的某个属性
```

| Object属性&方法 | 描述 |
| --------------- | ---- |
| constructor | 指向对象构造器 |
| prototype | 指向对象原型 |
| Object.assign({}, obj) | 对象复制 |
| Object.assign(obj1, obj2, obj3) | 对象合并 |
| Object.create(proto, [prop_Object])  |  模拟类（class） |
| Object.is(obj1, obj2) | 判断两个值是否严格相同 |
| Object.keys(obj)        | 返回对象所有属性的数组     |
| Object.delete(obj.prop) | 删除对象某个属性     |

**in操作符**：判断属性是否属于对象。

```js
prop in obj  // 判断prop是否属于obj
```

### 内置对象

JS内置对象（本地对象/全局对象）：由 ECMAScript 实现提供的、独立于宿主环境的所有对象，在 ECMAScript 程序开始执行时出现。
JS内置对象：Object，String，Array，Function，Boolean，Number，Math，Date，RegExp，Error等。

其中**Object**，**String**，**Array**，**Function**请参考上文。

**Number对象**：

| Number属性&方法 | 描述                                  |
| --------------- | ------------------------------------- |
| NaN             | 非数字值                              |
| MAX_VALUE       | 最大值                                |
| MIN_VALUE       | 最小值                                |
| toFixed(n)      | 返回指定n位小数的数字的字符串         |
| toExponential() | 返回指数为n的科学计数法的数字的字符串 |
| toPrecision()   | 把数字四舍五入格式化为指定的长度      |

**Math对象**：

静态调用方法；Math没有构造方法，不能生成实例。

| Math属性&方法 | 描述     |
| ------------- | -------- |
| Math.random() | 随机数   |
| Math.round()  | 四舍五入 |
| Math.ceil()   | 向上取整 |
| Math.floor()  | 向下取整 |

**Date对象**：

```js
var date = new Date();    // 当前日期和时间
var time = date.getTime();     // 返回从 1970 年 1 月 1 日至今的毫秒数
var year = date.getFullYear(); // 获取年份
date.setFullYear(yyyy, mm, dd); // 设置具体的日期
```

> 详细了解**JS内置对象**请参考：[JavaScript 对象参考手册](http://www.w3school.com.cn/jsref/index.asp)；

### 创建对象

1.原始方式一：

```js
var obj = new Object();
obj.name = "张三";
obj.age = 22;
obj.eat=function(){
	alert(this.name+"吃馒头");
}
```

2.原始方式二：

```js
var obj = {
	var name = "张三";
	var age = 20;
	var eat = function(){
        alert(this.name + "正在吃饭~");
	}
};
```

3.工厂方式：

```js
function objectFactory(name,age){
	return {
		name:name,
		age:age,
		eat:function(){
			alert(this.name+"吃馒头");
		}
	}
}
```

**4.构造函数★**：

```js
function Person(name,age){
	this.name=name,
	this.age=age,
	this.eat=function(){
		console.log(this.name+"吃馒头");
	}
}
```

**this关键字**：指向调用该方法的对象。

**instanceof操作符**：判断对象是否为类（构造方法）的一个实例。

```js
var obj = new Object();
obj instanceof Object;  // true  判断obj是否为Object的一个实例。
```
> 在 JavaScript 中，很多时候，你需要避免使用 `new `关键字。



### JS原型★

所有的函数对象(new)都存在原型对象(prototype)；

`函数对象.prototype`：指向函数对象的原型对象；

所有对象都存在`__proto__`属性，只有函数对象存在`prototype`属性；

所有原型对象都存在constructor属性，指向prototype属性所在函数；A.prototype.constructor == A；

原型对象（Person.prototype）是 构造函数（Person）的一个实例；



所有函数都可以通过prototype属性获取到函数原型，

通过对prototype.属性赋的值赋值给所有对象



prototype

作用：创建类的公有属性和公有方法

prototype的两个属性：

1.构造器constructor

2.原型__proto__



原型链

由[对象__proto__属性]和[对象构造函数的__proto__属性]构成的链式结构，Object__proto__就是Object；

原型链：对象属性调用优先级序列；本身属性>原型属性。



原型继承：设置[子类的原型]是[父类的实例]；



# JS DOM

DOM文档对象模型

![DOM树](http://p6uturdzt.bkt.clouddn.com/jsdom-htmltree.png)



## DOM获取页面元素

1.根据id获取元素：

```js
document.getElementById("id"); // 单个元素
```

2.根据标签名获取元素：

```js
document.getElementByTagName("标签名"); // 数组
```

3.根据name获取元素：

```js
document.getElementByName("name"); // 数组
```

4.根据类名获取元素：

```js
document.getElememtByClassName("类名"); // 数组
```

5.根据选择器获取元素：

```js
document.querySelectorAll("选择器"); // 数组
```

## DOM修改

1.改变HTML输出流：

```js
document.write();  // 直接向HTML输出流写内容。
```

2.改变HTML内容：

```js
元素.innerText;  // 获取/设置文本值（对代码转义为文本）
元素.innerHTML;  // 获取/设置HTML代码
```

3.改变HTML属性：

```js
元素.HTML属性 = 新属性值 // 改变HTML属性
```

4.自定义HTML属性

```js
元素.getAttribute("属性");      // 获取属性
元素.setAttribute("属性","值")  // 设置属性
元素.removeAttribute("属性");   // 移除属性
```

5.改变CSS样式：

```js
元素.style.CSS样式 = 新样式 // 改变CSS样式
```

> CSS属性名多个单词以-分隔，JS调用CSS属性名多个单词以驼峰命名分隔；

## DOM节点操作

DOM节点：文档Document->元素Element->属性Attribute->文本Text；

**1.当前节点属性**：

| 当前节点属性 | 描述                                             |
| ------------ | ------------------------------------------------ |
| nodeName     | 节点名称                                         |
| nodeValue    | 返回/设置当前文本节点的文本字符串                |
| textContent  | 当前节点及后代节点的文本内容                     |
| nodeValue    | 节点类型；元素=1\|属性=2\|文本=3\|注释=8\|文档=9 |

**2.当前节点的相关节点**：

| 当前节点的相关节点 | 描述           |
| ------------------ | -------------- |
| ownerDocument      | 所属文档       |
| previousSibling    | 前一个同级节点 |
| nextSibling        | 下一个同级节点 |
| parentNode         | 父节点         |
| parentElement      | 父元素         |
| firstChild         | 子节点         |
| children           | 子元素         |

**3.针对父节点的操作**：

| 针对父节点的DOM方法   | 描述                 |
| --------------------- | -------------------- |
| appendChild()         | 追加一个子节点       |
| removeChild()         | 移除子节点           |
| replaceChild()        | 替换子节点           |
| insertBefore(new,old) | 在旧节点前插入新节点 |
| isEqualNode()         | 判断节点是否相同     |

**4.创建节点**：

| 创建节点          | 描述         |
| ----------------- | ------------ |
| createAttribute() | 创建属性节点 |
| createElement()   | 创建元素节点 |
| createTextNode()  | 创建文本节点 |

## DOM事件

| 事件        | 描述         |
| ----------- | ------------ |
| onclick     | 点击事件     |
| onfocus     | 元素获得焦点 |
| onblur      | 元素失去焦点 |
| onmouseover | 鼠标覆盖     |
| onmouseout  | 鼠标移开     |
| onchange    | 发生改变     |
| onload      | 加载完成     |
| onunload    | 退出页面     |
| onerror     | 加载错误     |

事件三要素：事件源，事件名称，事件处理程序;

事件绑定：
①获取元素：var 元素 = document.getElementByXXX("");
②事件函数：元素.事件 = function(){ 事件处理程序 };
this：事件源
return false：取消事件源的默认动作

事件传递方式：
-事件捕获：Document -> Element -> Attribute -> Text；
-事件冒泡：Document <- Element <- Attribute <- Text；
默认事件传递方式：事件冒泡

阻止事件传播的方式：
标准方式：event.stopPropagation阻止事件传递；

注册/移除事件的三种方式：
1.事件源.on+事件类型：onclick
2.事件源.addEventListener(eventName,eventHandler,[useCapture])
&nbsp;&nbsp;&nbsp;useCapture==true;捕获阶段；默认值为false；IE9之前的不兼容
3.事件源.attachEvent(eventName,eventHandler,[useCapture])

# JS BOM

BOM浏览器对象模型

## window-浏览器窗口

window对象：浏览器窗口；

window对象是BOM顶级对象，document，location，history，navigator都是其子对象。

| window属性&方法    | 描述                 |
| ------------------ | -------------------- |
| window.name        | window对象名称       |
| window.innerHeight | 浏览器窗口的内部高度 |
| window.innerWidth  | 浏览器窗口的内部宽度 |

### JS入口函数

```js
// 原生JS入口函数：等待加载完页面元素后再执行JS代码
window.onload = function(){ JS代码 }  // 原生JS入口函数
```

### JS弹出框

1.警告框：

```js
window.alert("警告");  // 警告框；
```

2.确认框：

```js
var flag = window.confirm("确定要删除？"); // 确认框；
// 确定：返回true | 取消：返回false
```

3.提问框：

```js
var input = window.prompt("你的年龄？");  //提问框；
// 确定：返回输入值 | 取消：返回null
```

> 可省略windows对象，直接使用。

### JS定时器

1.单次定时器：

```js
// 设置单次定时器
var timerId = window.setTimerout(function(){定时任务},timeout);  // 只执行一次
// 清除单次定时器
window.clearTimeout(timerId);
```

2.循环定时器：

```js
// 设置循环定时器
var timerId = window.setInterval(function(){定时任务},timeout);  // 循环执行
// 清除循环定时器
window.clearInterval(timerId);
```

> 可省略windows对象，直接使用。

```js
// 循环定时器：由单次定时器取消。
var timer2 = setInterval(function(){
	document.write(new Date());//输出当前时间
},1000)
setTimeout(function(){
	clearInterval(timer2);//清除定时器timer2
},5000)
```

## location-浏览器url

location对象：浏览器地址

| location属性&方法 | 描述                                         |
| ----------------- | -------------------------------------------- |
| location.href     | 获取url                                      |
| location.protocol | 返回所使用的 web 协议（http:// 或 https://） |
| location.hostname | 返回 web 主机的域名                          |
| location.pathname | 返回当前页面的路径和文件名                   |
| location.port     | 返回 web 主机的端口（80 或 443）             |
| location.assign() | 加载页面                                     |
| location.reload() | 重新加载                                     |

> url统一资源定位符
> url格式：scheme://host:port/path?query#fragment
> scheme：通信协议；如http，ftp，maito，https等；
> host：主机；服务器域名系统主机名、IP地址；
> port：端口；http默认端口80；
> path：路径；
> query：查询；可选，用于给动态网页传递参数，参数名1=值1&参数名2=值2；
> fragment：信息片段；字符串，锚点；

## history-会话历史

history对象：会话历史

| history属性&方法 | 描述         |
| ---------------- | ------------ |
| back()           | 后退，go(-1) |
| forword()        | 前进，go(1)  |
| go(n)            | 跳转n步      |

## navigator-浏览器信息

navigator对象：浏览器信息

| navigator属性&方法   | 描述                           |
| -------------------- | ------------------------------ |
| navigator.appName    | 浏览器名称                     |
| navigator.appVersion | 浏览器版本                     |
| navigator.language   | 浏览器语言                     |
| navigator.platform   | 操作系统类型                   |
| navigator.userAgent  | 浏览器设定的`User-Agent`字符串 |

> 参考资料：
> W3school：[JavaScript教程](ECMAScript)，[ECMAScript](http://www.w3school.com.cn/js/pro_js_history.asp)；
> 菜鸟教程：[JavaScript教程](http://www.runoob.com/js/js-tutorial.html)；



