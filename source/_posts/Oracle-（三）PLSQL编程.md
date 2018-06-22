---
title: Oracle | （三）PL/SQL编程
comments: true
date: 2018-05-15 17:19:29
id: oracle-plsql
tags:
- oracle
- database
categories: Database
toc: true
reward: true
copyright: true
---

<!--# Oracle | （三）PL/SQL编程-->

PL/SQL即过程化SQL语言，是一种高级数据库程序设计语言，专门用于在各种环境下对ORACLE数据库进行访问。由于该语言集成于数据库服务器中，所以PL/SQL代码可以对数据进行快速高效的处理。 

<!--more-->

## PL/SQL中可用的SQL语句 

- 可用DML语句：SELECT INTO，INSERT，UPDATE，DELETE。
- 可用TCL语句：COMMIT，ROLLBACK，SAVEPOINT。
- 不能使用DDL语句。



## PL/SQL块
PL/SQL块：声明部分+执行部分+异常处理部分

```plsql
DECLARE
	/* 声明部分：声明变量，类型、游标、局部存储过程和函数 */
BEGIN
	/* 执行部分：执行过程和SQL语句 */
[EXCEPTION]
	/* 异常处理部分 */
END;
```

### 变量类型
基本数据类型：number，varchar2...
record类型：
%Type类型：
%RowType类型：

### 运算符

赋值：`:=`
关系：`=>`
dbms_output.put_line()

### 流程控制

### 异常处理
预定义异常
非预定义异常

```sql
when ... then ...
```

SQLCODE：异常编号；
SQLERRM：错误信息；


### 游标
游标概念：句柄/指针。

显式游标：
①定义游标：Cursor name (参数1 参数类型,参数2 参数类型) IS select查询
②打开游标：OPEN cursor_name (参数1 => 值,参数2 => 值)
③提取游标数据：FETCH
④关闭游标：CLOSE cursor_name
> 参数可省略。

游标属性：
%FOUND：最近一次读取记录成功返回true
%NOTFOUND：
%ISOPEN：是否打开
%ROW

```sql
for 索引 IN 游标[参数] loop
    循环语句;
end loop;
```

隐式游标：主要用于数据更新。由Oracle系统提供，不需要用户定义游标，也不允许用户操作游标



## PL/SQL存储单元
存储过程：执行特定操作，无返回值
函数：执行复杂操作，有返回值

函数的三种执行方式

包：过程与函数的组合体



触发器：事件触发，执行相应操作；








