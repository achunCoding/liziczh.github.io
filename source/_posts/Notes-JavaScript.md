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
## JS变量

### JS变量命名规则

1.见名知意
2.驼峰命名法：首个单词全小写，之后的单词首字母大写。
3.`abc123_$`
4.不能以数字开头
5.不能使用关键字
6.严格区分大小写

### JS变量声明

1.JS使用**`var`**声明变量：

```js
var a = 3;  //JS使用var声明变量
/* 定义在函数内：局部变量 
   定义在函数外：全局变量 */
```

2.JS**直接使用标识符**声明变量：

```js
x = 4;  //JS直接使用标识符声明变量，全局变量； 
```

### JS变量作用域

| 变量类型 | 描述                               |
| -------- | ---------------------------------- |
| 全局变量 | 定义在函数外的var变量 \| 无var变量 |
| 局部变量 | 定义在函数内的var变量              |

### JS变量提升（Hoisting）★

**变量提升**：JS函数及变量的声明都将被提升到函数的最顶部。

## JS数据类型

JavaScript是一种弱类型语言（动态类型），相同的变量可用作不同的类型。

### JS基本数据类型

**1.number | 数字**：

```js
3;      // 整数
3.4;    // 浮点数
123e5;  // 科学计数法
0xFFFF; // 十六进制数
NaN;    // 非数字，任何涉及NaN的计算，都返回NaN。
```

- isNaN()：用来判断是否为一个非数字；

**2.string | 字符串**：

```js
"abc";  // 双引号字符串
'abc';  // 单引号字符串
"\r\n"  // 转义字符
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

**3.boolean | 布尔型**：

```js
true;  // true值
false; // false值
```

**4.undefined | 未赋值变量**：

```js
undefined; // 意为"缺少值"，未赋值的变量;（用于变量类型）
```

**5.null | 空指针**：

```js
null; // 空对象指针，（用于对象类型）
/* 对象=null 并非没有类型，类型为Object; */
```

**6.Object | 对象**：一组属性和方法的集合。

**区分undefined和null★**：

```js
number(null)==0
number(undefined)==NaN;
/* 目前null与undefined基本同义 */
```

### JS引用类型

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
var obj = new Object();  // 创建一个Object对象
```

**2.Array | 数组**：[]

```js
var arr = [1,2,3];  
```

```js
var arr = new Array(1,2,3);  //创建一个数组对象
```

**3.Function | 函数**：

```js
function f(){}  // 一般函数声明方式
```

```js
var f = function(){}  // 函数表达式
```

JavaScript中函数也是对象。

### JS类型转换

1.转换为字符串：

```js
String();   // 可转换任意数据类型（null,undefined转换后还是null,undefined）
String(null); // null
String(undefined); // undefined
```

```js
toString(); // null,undefined没有toString()
```

2.转换为数字：

```js
Number("99 88"); // 返回NaN
Number(false);   // 返回0
Number(true)     // 返回1
```

### typeof 操作符

```js
/* typeof操作符：检测变量数据类型 */
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

## JS运算符

1.算术运算符：`+`，`-`，`*`，`/`，`%`，`++`，`--`
2.关系运算符：`>`，`<`，`>=`，`<=`，`==`，`!=`
3.逻辑运算符：`&`，`|`，`~`，`^`，`!`，`&&`，`||`
4.位运算符：`<<`，`>>`，`>>>`，`~`，`&`，`|`，`^`
5.赋值运算符：`=`，`+=`，`-=`，`*=`，`/=`，`%=`
6.条件运算符：`a?b:c `

JS运算符中存在**双等**与**三等**★：
`==`和`!=`：只比较值，不比较类型。
`===`和`!==`：既比较值，也比较类型。

## JS语句

### 判断语句

**if语句：**

```js
if(条件表达式){
    条件为true执行语句;
}else{
    条件为false执行语句;
}
```

**switch语句：**

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

**while循环：**

```js
var i = 0;
while(i<10){
	循环体;
	i++;
}
```

**do while循环：**

```js
// 先执行一次后判断
var i = 0;
do{
	循环体;
    i++;
}while(i<10);
```

**for循环：**

```js
for(var i = 0;i<10;i++){
	循环体;
}
```

**for-in循环：**

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

字符串本质是一个不可变的字符数组。

### 创建字符串

1.使用**字面量**创建字符串：

```js
var str = "abc";  // 使用字面量创建字符串
```

2.使用**对象**创建字符串：

```js
var str = new String("abc"); //创建一个String对象
```

### 字符串拼接

```js
var str = "abc"+"def";  // 使用“+”拼接字符串
```

### string常用方法

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

### 创建数组

```js
var arr=[];
var arr=new Array();
```

### 遍历数组

1.使用**普通for循环**遍历：

```js
for(var i = 0 ; i < arr.length ; i++){
    console.log(arr[i]);
}
```

2.使用**for-each**遍历：

```js
for(var i in arr){
    console.log(arr[i]);
}
```

### Array常用方法

| Array方法     | 描述                                                  |
| ------------- | ----------------------------------------------------- |
| isArray()     | 判断是否为数组                                        |
| valueOf()     | 返回数组本身                                          |
| toString()    | 将数组以字符串的形式返回                              |
| push()        | 向数组末尾追加数据，返回当前数组的长度                |
| pop()         | 删除数组最后一个元素                                  |
| join()        | 将数组转换为字符串，默认按逗号隔开                    |
| shift()       | 在数组头部删除一个元素                                |
| unshift()     | 在数组头部添加一个元素                                |
| reverse()     | 数组反转                                              |
| slice()       | 数组截取                                              |
| splice()      | 数组截取，并且可以插入新的元素(改变原数组)            |
| sort()        | 排序；数字按大小排，字母按字典顺序排，汉字按Unicode排 |
| indexOf()     | 索引                                                  |
| lastIndexOf() | 反序索引                                              |

## JS函数

JS函数是一种数据类型[function]，JS函数也是对象。

### JS函数定义

1.使用**函数声明**定义：

```js
function 函数名([形参]){}  // 函数声明
```

2.使用**函数表达式**定义：

```js
var 函数名 = function([形参]){}  // 函数表达式 | 匿名函数
```

3.使用**Function()**定义：

```

```

4.自执行函数：自己调用自己

```js
(function 函数名([形参]){
    函数体;
})([实参]);
```

### 函数参数

函数显式参数（形参）：parameters

函数隐式参数（实参）：arguments

### 一等公民★

**一等公民**：JS函数与JS变量处于同等地位，可作为一个值使用。
1.将函数赋值给变量
2.将函数赋值给对象的属性
3.将函数作为参数出入其他函数
4.将函数作为返回结果

### 函数提升（Hoisting）★

**函数提升**：JS函数及变量的声明都将被提升到函数的最顶部。

## JS弹出框

1.警告框：

```js
alert("警告");  // 警告框；
```

2.确认框：

```js
var flag = confirm("确定要删除？"); // 确认框；确定：返回true; 取消：返回false;
```

3.提问框：

```js
var input = prompt("你的年龄？");  //提问框；
```



# JS面向对象

## JS内置对象

JS内置对象（全局对象）：String，Number，Array，Math，Date；

### String

eval("js代码")：执行内部js代码;非法调用报错

encodeURL(),decodeURL();

parseInt(),parseFloat();

### Number

### Array

### Math

静态调用方法；因为没有构造方法所以不能生成实例

### Date

Date()：当前日期时间；

getTime：1970距今的毫秒数；

减法运算：时间间隔；

## JS自定义对象



1.简单方式一

```js
var obj = new Object();
obj.name = "张三";
obj.age = 22;
obj.eat=function(){
	alert(this.name+"吃馒头");
}
```

2.简单方式二

```js
var obj={
	name:"张三",
	age:21,
	eat:function() {
		alert(this.name+"吃馒头");
	}
}
```

3.工厂函数创建对象

```js
function createObject(name,age){
	return {
		name:name,
		age:age,
		eat:function(){
			alert(this.name+"吃馒头");
		}
	}
}
```

4.构造函数

```js
function Person(name,age){
	this.name=name,
	this.age=age,
	this.eat=function(){
		console.log(this.name+"吃馒头");
	}
}
```

对象

函数对象：new Object();

普通对象：非new对象

Object.keys(对象)：获取对象所有属性

Object.delete(对象.属性):删除对象某个属性

属性名 in 对象:判断属性是否属于对象



## JS原型

### 原型

所有的[函数对象(new)]都存在[原型对象(prototype)]；

函数对象.prototype：指向函数对象的原型对象；

所有对象都存在__proto__属性，只有函数对象存在prototype属性；

所有原型对象都存在constructor属性，指向prototype属性所在函数；A.prototype.constructor == A;

原型对象（Person.prototype）是 构造函数（Person）的一个实例

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

​    

继承：设置[子类的原型]是[父类的实例]











#JavaScript代码规范

在 JavaScript 中，很多时候，你需要避免使用 `new `关键字。