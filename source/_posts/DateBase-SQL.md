---
title: DateBase | SQL
comments: true
date: 2018-04-27 19:32:29
id: notes-sql
tags:
- datebase
categories: DateBase
---

# SQL

SQL结构化查询语言，用于访问和处理关系数据库的标准语言。
将SQL分为两个部分：数据操作语言 (DML) 和 数据定义语言 (DDL)。

<!--more-->

# SQL DML

- SELECT：查询
- INSERT：插入
- UPDATE：更新
- DELETE：删除

## SQL查询★

SELECT 语句的一般格式：

```sql
SELECT [DISTINCT] <目标列表达式> [AS] <别名>
FROM <表/视图> [AS] <别名>
[WHERE <查询条件>]
[GROUP BY <分组列> [HAVING <分组条件>]]
[ORDER BY <排序列> [ASC|DESC]];
```

### 单表查询

#### SELECT 子句：选择数据

```sql
SELECT [DISTINCT] <目标列表达式> [AS] <别名>
FROM <表/视图> [AS] <别名>
```

1.查询全部列：`*`

```sql
SELECT *
FROM <表/视图>
```

2.去除重复行：`DISTINCT`

```sql
SELECT DISTINCT <目标列>
FROM <表/视图>
```

3.指定别名（Alias）：

```sql
<列名/表名> <别名>
<列名/表名> AS <别名>
```

#### **WHERE 子句：查询条件**

```sql
WHERE <查询条件>
```

**查询条件**：

1.比较运算：`>`，`<`，`=`，`>=`，`<=`，`!=`/`<>`

2.确定范围：`BETWEEN...AND...`

```sql
<列名> [NOT] BETWEEN <下限> AND <上限>
```

3.确定集合：`IN`

```sql
<列名> [NOT] IN （值1, 值2...）
```

4.模式匹配：`LIKE`

```sql
<列名> [NOT] LIKE '<匹配模式>'
```

| 通配符                         | 描述                         |
| ------------------------------ | ---------------------------- |
| `%`                            | 替代一个或多个字符           |
| `_`                            | 替代一个字符                 |
| `[charlist]`                   | 字符序列中的任何单一字符     |
| `[!charlist]`<br>`[^charlist]` | 不在字符序列中的任何单一字符 |

5.空值：`IS NULL`

```sql
<列名> IS [NOT] NULL
```

6.多重条件（逻辑运算）：`AND`，`OR`，`NOT`

```sql
<条件表达式> AND <条件表达式>
<条件表达式> OR <条件表达式>
NOT <条件表达式>
```

> AND优先级>OR优先级
>

#### **ORDER BY 子句：排序**

ORDER BY 子句将查询结果按指定列进行**升序 (ASC)** 或**降序 (DESC)** 排序。

```sql
ORDER BY <排序列> [ASC|DESC]
```

> ORDER BY 子句只能对最终查询结果排序。不能对内层查询使用。

#### 聚集函数

| 聚集函数                  | 描述           |
| ------------------------- | -------------- |
| `COUNT(*)`                | 统计记录行数   |
| `COUNT([DISTINCT]<列名>)` | 统计列中值个数 |
| `SUM([DISTINCT]<列名>)`   | 计算列值总和   |
| `AVG([DISTINCT]<列名>)`   | 计算列值平均值 |
| `MAX([DISTINCT]<列名>)`   | 求列值最大值   |
| `MIN([DISTINCT]<列名>)`   | 求列值最小值   |

> 注意：
> ①只有COUNT(*)计算空值，其余聚集函数都跳过空值。
> ②WHERE 子句中不能用聚集函数，聚集函数只能用于 SELECT 子句和 GROUP BY 中的 HAVING 子句。

#### **GROUP BY 子句：分组**

GROUP BY 子句将查询结果按某一列或多列的值分组，值相等的为一组。

```sql
GROUP BY <分组列> HAVING <分组条件>
```

> 分组的目的是为了细化聚集函数的作用对象，分组后聚集函数将作用于每一个组，即每一组都有一个聚集函数值。

**WHERE 子句与 HAVING 子句区别**：
①WHERE 子句作用于基本表/视图，不能使用聚集函数。
②HAVING 子句作用于组。



### 连接查询

#### 交叉连接

交叉连接：笛卡儿积

```sql
SELECT <目标列表达式>
FROM <表1> CROSS JOIN <表2>;
```

```sql
SELECT <目标列表达式>
FROM <表1>, <表2>;
```

#### 内连接

内连接：只要存在匹配，就返回匹配行。

```sql
SELECT <目标列表达式>
FROM <表1> [INNER] JOIN <表2> 
WHERE <表1>.<关联属性> = <表2>.<关联属性>;
```

> `INNER JOIN` 等同于 `JOIN`。

##### 1.等值连接

```sql
SELECT <目标列表达式>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> = <表2>.<关联属性>;
```

##### 2.非等值连接

```sql
SELECT <目标列表达式>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> <比较运算符> <表2>.<关联属性>;
```

> 比较运算符：`>`，`<`，`=`，`>=`，`<=`，`!=`，`<>`

##### 3.自然连接

自然连接：去除目标列中重复列的等值连接。

```sql
SELECT <目标列表达式>
FROM <表1> NATURAL JOIN <表2>;
```

#### 外连接

##### 1.左外连接

左连接：以左表为主表，右表为从表。即使右表中没有匹配，也返回左表所有行。

```SQL
SELECT <目标列表达式>
FROM <表1> LEFT JOIN <表2>;
```

##### 2.右外连接

右连接：以右表为主表，左表为从表。即使左表中没有匹配，也返回右表所有行。

```sql
SELECT <目标列表达式>
FROM <表1> RIGHT JOIN <表2>;
```

##### 3.全外连接

全外连接：返回左表和右表中的所数据。未匹配字段显示为NULL。

```sql
SELECT <目标列表达式>
FROM <表1> OUTER JOIN <表2>;
```



### 嵌套查询







## SQL更新

### SQL插入

```sql
INSERT INTO <表> (列名, 列名...) VALUES(值, 值...)
```

INSERT简写-按表的列顺序插入一行数据：

```sql
INSERT INTO <表> VALUES(值, 值...)
```

### SQL修改

```sql
UPDATE <表> SET 列名 = 值, 列名 = 值... 
[WHERE 修改条件]
```

### SQL删除

```sql
DELETE FROM <表> 
[WHERE 删除条件]
```