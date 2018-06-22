---
title: Oracle | （三）PL/SQL编程
comments: true
date: 2018-05-15 17:19:29
id: oracle-plsql
tags:
- oracle
- database
categories: DataBase
toc: true
reward: true
copyright: true
---

<!--# Oracle | （三）PL/SQL编程-->

PL/SQL即过程化SQL语言，是一种高级数据库程序设计语言，专门用于在各种环境下对ORACLE数据库进行访问。由于该语言集成于数据库服务器中，所以PL/SQL代码可以对数据进行快速高效的处理。 

<!--more-->

## PL/SQL中可引用的SQL语句 

- 可用DML语句：SELECT INTO，INSERT，UPDATE，DELETE。
- 可用TCL语句：COMMIT，ROLLBACK，SAVEPOINT。
- 不能使用DDL语句。

## PL/SQL块
PL/SQL块：声明部分+执行部分+异常处理部分

```plsql
-- 注释
/* 注释 */
DECLARE
	/* 声明部分：声明变量，类型、游标、局部存储过程和函数 */
BEGIN
	/* 执行部分：执行过程和SQL语句 */
[EXCEPTION]
	/* 异常处理部分 */
END;
```

## PL/SQL变量

### PL/SQL变量命名

| 标识符   | 命名规则        |
| -------- | --------------- |
| 程序变量 | V_name          |
| 程序常量 | C_Name          |
| 游标变量 | Name_cursor     |
| 异常标识 | E_name          |
| 表类型   | Name_table_type |
| 表       | Name_table      |
| 记录类型 | Name_record     |

### PL/SQL变量类型

#### 基本数据类型

number，char，varchar2，long，date

#### 记录类型

记录类型：把逻辑相关的数据作为一个单元存储起来，用于存放互不相同但逻辑相关的信息。 

```plsql
TYPE record_type IS RECORD(
   Field1 type1  [NOT NULL]  [:= exp1 ],
   Field2 type2  [NOT NULL]  [:= exp2 ],
   . . .   . . .
   Fieldn typen  [NOT NULL]  [:= expn ] ) ;
```

#### %TYPE类型

%TYPE类型：指某个已定义变量的数据类型类型，或数据表中某列的数据类型。

使用%TYPE特性的优点：

- 所引用的数据库列的数据类型可以不必知道；
- 所引用的数据库列的数据类型可以实时改变。

#### %RowType类型

%RowType类型：返回一个与数据库表的数据结构一致的记录类型。

使用%ROWTYPE特性的优点：

- 所引用的数据库中列的个数和数据类型可以不必知道；
- 所引用的数据库中列的个数和数据类型可以实时改变。

### PL/SQL特殊运算符

赋值运算符：`:=`
关系运算符：`=>`

## PL/SQL流程控制

### 条件语句

#### IF语句

```plsql
IF <条件语句1> THEN
	语句1;
ELSIF <条件语句2> THEN
	语句2;
ELSE
	语句3;
END IF;
```

> 注意是`ELSIF`不是<s>`ELSEIF`</s>；

#### CASE语句

```plsql
CASE <变量>
	WHEN <值1> THEN <结果1>
	WHEN <值2> THEN <结果1>
	...
	WHEN <值N> THEN <结果N>
	[ELSE <结果N+1>]
END;
```

### 循环语句

#### do...while循环

```plsql
LOOP
	循环语句;
	EXIT WHEN <条件语句>
END LOOP;
```

#### while循环

```plsql
WHILE <条件语句> LOOP
	循环语句;
END LOOP;
```

#### for循环

```plsql
FOR <循环计数器> IN [REVERSE] <下限> .. <上限> LOOP
  循环语句;
END LOOP;
```

### GOTO语句

定义标号：`<<标号名>>`；

GOTO语句：`GOTO 标号名`；

### NULL语句

NULL语句：不做任何事，增强代码可读性。

## PL/SQL异常处理

预定义异常
非预定义异常

```sql
when ... then ...
```

SQLCODE：异常编号；
SQLERRM：错误信息；


## 游标
游标是系统为用户开设的一个数据缓冲区，存放SQL语句的执行结果。

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








