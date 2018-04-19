---
title: JavaScript | 原型
comments: true
date: 2018-04-19 17:45:07
id: js-prototype
tags:
- js
categories: Web
---

## JavaScript原型

原型（prototype）简化了继承。

<!-- more -->

### 构造函数

JavaScript是一门面向对象的编程语言，所有数据类型都是对象。
Brendan Eich为JavaScript设计了**继承**机制，但并未引入“类”的概念，而是采用**构造函数**直接生成实例。

```js
// 构造函数
function Person(name,age){
	this.name=name,
	this.age=age,
}
// 使用[构造函数]生成实例
var p1 = new Person("Tom",20);
```

### 原型对象

**引入prototype属性**：
使用构造函数直接生成实例，存在一个问题：无法共享通用数据。
为了共享的通用属性和方法，Brendan Eich为构造函数设置了一个**prototype属性**，指向**构造函数的原型对象**。
原型对象用于存放所有实例共享的通用属性和方法。构造函数每生成一个实例对象，将自动引用prototype对象中共享的属性和方法。

```js
// 构造函数
function Person(name,age){
	this.name=name,
	this.age=age,
}
// 原型对象：添加共享属性&方法
Person.prototype = {species: '人类'}
// 使用[构造函数]生成一个实例
var p1 = new Person("Tom",20);
// 可调用共享属性
alert(p1.species); // 人类
```

**原型对象的属性**：
①`__proto__`：指向**创建它**的**函数对象**的**原型对象**；
②`constructor`：指向构造函数；

```js
Obj.prototype.constructor = Obj
```

### 原型链

**原型链**：JS对象（不论是普通对象还是函数对象）都有`__proto__`属性，指向**创建它**的**函数对象**的**原型对象**。通过`__proto__`向上遍历直到`Object.prototype.__proto__ = null`构成原型链。

注意：使用`__proto__`可使**实例（子）**获取**构造器（父）**的原型对象，容易造成不必要的麻烦。所以`__proto__`仅是为了实现原型链继承机制而存在的一个属性，不推荐在编程中使用。

### 原型继承

原型继承：当查找一个对象的属性时，JavaScript会向上遍历原型链，直到找到相应的属性为止。
原型继承的本质：由于所有的实例对象共享同一个prototype对象，那么从外界看起来，prototype对象就好像是实例对象的原型，而实例对象则好像"继承"了prototype对象一样。

原型继承：设置[子类的原型]是[父类的实例]。

```js
son.prototype = new Father()
```




> 参考资料：
> 阮一峰老师：[Javascript继承机制的设计思想](http://www.ruanyifeng.com/blog/2011/06/designing_ideas_of_inheritance_mechanism_in_javascript.html)
