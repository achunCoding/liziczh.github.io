---
title: DB | Oracle
comments: true
date: 2018-05-14 17:32:29
id: db-oracle
tags:
- database
categories: DataBase
---

<!--# Oracle数据库-->

<!--more-->

# SQL DML

SQL结构化查询语言，用于访问和处理关系数据库的标准语言。

DML数据操作语言

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

#### 简单查询：SELECT

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

```mysql
<列名/表名> <别名>
<列名/表名> AS <别名>
```

#### 查询条件：WHERE

```sql
SELECT <目标列表达式> [AS] <别名>
FROM <表/视图> [AS] <别名>
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

#### 查询排序：ORDER BY

ORDER BY 子句将查询结果按指定列进行**升序 (ASC)** 或**降序 (DESC)** 排序。

```mysql
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

#### 分组查询：GROUP BY

GROUP BY 子句将查询结果按某一列或多列的值分组，值相等的为一组。

```sql
GROUP BY <分组列> HAVING <分组条件>
```

> 分组的目的是为了细化聚集函数的作用对象，分组后聚集函数将作用于每一个组，即每一组都有一个聚集函数值。

**WHERE 子句与 HAVING 子句区别**：
①WHERE 子句作用于基本表/视图，不能使用聚集函数。
②HAVING 子句作用于组。



### 连接查询

连接查询：使用连接运算符实现多表查询 

#### 交叉连接

交叉连接：笛卡儿积。

①隐式连接：

```sql
SELECT <目标列>
FROM <表1>, <表2>
```

②使用 `JOIN` 连接：

```mysql
SELECT <目标列>
FROM <表1> CROSS JOIN <表2>
```

>消除笛卡尔积：使用关联字段。 

#### 内连接

内连接：查询与连接条件匹配的所有行，但不去除重复属性列。

①隐式连接：

```sql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> <比较运算符> <表2>.<关联属性>
```

②使用 `JOIN` 连接：

```mysql
SELECT <目标列>
FROM <表1> [INNER] JOIN <表2> 
ON <表1>.<关联属性> <比较运算符> <表2>.<关联属性> 
```

##### **1.等值连接**

等值连接：当比较运算符为`=`时的内连接，不去除重复属性列。

①隐式连接：

```sql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> = <表2>.<关联属性>
```

②使用 `JOIN` 连接：

```mysql
SELECT <目标列>
FROM <表1> [INNER] JOIN <表2> 
ON <表1>.<关联属性> = <表2>.<关联属性>
```

##### **2.非等值连接**

非等值连接：当比较运算符**不为**`=`时的内连接，不去除重复属性列。

①隐式连接：

```sql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> <比较运算符> <表2>.<关联属性>
```

②使用 `JOIN` 连接：

```mysql
SELECT <目标列>
FROM <表1> [INNER] JOIN <表2> 
ON <表1>.<关联属性> <比较运算符> <表2>.<关联属性>
```

##### 3.自身连接

自身连接：一个表与其自身进行等值连接。

①隐式连接：

```sql
SELECT <目标列>
FROM <表> FIR, <表2> SEC
WHERE FIR.<关联属性> = SEC.<关联属性>
```

②使用 `JOIN` 连接：

```mysql
SELECT <目标列>
FROM <表> FIR [INNER] JOIN <表2> SEC
ON FIR.<关联属性> = SEC.<关联属性>
```

##### 4.自然连接

自然连接：去除重复属性列的等值连接，消除了笛卡儿积。

```mysql
SELECT *
FROM <表1> NATURAL JOIN <表2>
```


#### 外连接

外连接：主表内容全部显示。未匹配到，用NULL填充。

##### 1.左外连接

左外连接：以左表为主表，右表为从表。即使右表中没有匹配，也返回左表所有行。

```mysql
SELECT <目标列>
FROM <表1> LEFT [OUTER] JOIN <表2>
ON <表1>.<关联属性> = <表2>.<关联属性>
```

**Oracle特有写法**：从表以 `(+)` 表示。

```mysql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> = <表2>.<关联属性>(+)
```

##### 2.右外连接

右外连接：以右表为主表，左表为从表。即使左表中没有匹配，也返回右表所有行。

```mysql
SELECT <目标列>
FROM <表1> RIGHT [OUTER] JOIN <表2>
ON <表1>.<关联属性> = <表2>.<关联属性>
```

**Oracle特有写法**：从表以 `(+)` 表示。

```plsql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性>(+) = <表2>.<关联属性>
```

##### 3.全外连接

全外连接：返回左表和右表中的所有数据。未匹配字段显示为NULL。

```mysql
SELECT <目标列>
FROM <表1> FULL [OUTER] JOIN <表2>
ON <表1>.<关联属性> = <表2>.<关联属性>
```

#### 指定关联字段

①隐式连接-使用WHERE子句指定关联字段：

```sql
SELECT <目标列>
FROM <表1>, <表2>
WHERE <表1>.<关联属性> <比较运算符> <表2>.<关联属性>
```

②JOIN连接-使用`ON`指定关联字段：

```sql
SELECT <目标列>
FROM <表1> JOIN <表2> 
ON <表1>.<关联属性> <比较运算符> <表2>.<关联属性>
```

③JOIN连接-使用`USING`指定关联字段：

```mysql
SELECT <目标列>
FROM <表1> JOIN <表2> 
USING (<关联属性>)
```

>USING等价于ON指定**等值同名**的关联字段。

### 子查询

查询块：临时表

```sql
SELECT <目标列>
FROM <表>
WHERE <查询条件>
```

#### 嵌套查询

嵌套查询：将一个查询块嵌套在另一个查询块的WHERE/HAVING条件子句中。

```sql
SELECT <目标列>
FROM <表>
WHERE <列名> <运算符/谓词> 
	(SELECT <目标列>
	 FROM <表>
	 WHERE <查询条件>)
```

##### **1.带有比较运算符的子查询**

当子查询返回单值时，可以使用**比较运算符**连接。

```sql
SELECT <目标列>
FROM <表>
WHERE <列名> <比较运算符>
	(SELECT <目标列>
	 FROM <表>
	 WHERE <查询条件>)
```

> 比较运算符：`>`，`<`，`>=`，`<=`，`!=`，`<>`，`=`

##### **2.带有IN的子查询**

当子查询返回一个集合时，一般使用**IN**进行连接。IN在嵌套查询中最为常用。

```sql
SELECT <目标列>
FROM <表>
WHERE <列名> IN
	(SELECT <目标列>
	 FROM <表>
	 WHERE <查询条件>)
```

##### **3.带有ANY或ALL的子查询**

```plsql
SELECT <目标列>
FROM <表>
WHERE <列名> <比较运算符>ANY
	(SELECT <目标列表达式>
	 FROM <表>
	 WHERE <查询条件>)
```

> <比较运算符>ALL：与子查询结果的**所有值**进行比较运算。
> <比较运算符>ANY：与子查询结果的**任意某个值**进行比较运算。
>

#### 派生查询

派生查询：将一个查询块嵌套在另一个查询块的FROM子句中，子查询生成的派生表成为了主查询的查询对象。

```sql
SELECT <目标列>
FROM <表>, (SELECT <目标列> FROM <表> WHERE <查询条件>) [AS] <别名>
WHERE <查询条件>
```

> 注意：必须为子查询生成的派生表指定别名。

### 集合查询

集合查询：多个查询结果进行集合运算。

```sql
SELECT <目标列> FROM <表> WHERE <查询条件>
	<集合运算谓词>
SELECT <目标列> FROM <表> WHERE <查询条件>
```

> 注意：参加集合操作的**各查询结果的列数**必须相同，**对应项的数据类型**也必须相同。

| 集合运算         | 谓词        |
| ---------------- | ----------- |
| 并集（去重复）   | `UNION`     |
| 并集（不去重复） | `UNION ALL` |
| 交集             | `INTERSECT` |
| 差集             | `MINUS`     |




## SQL更新

### SQL插入：INSERT

```sql
INSERT INTO <表> (列名, 列名...) VALUES(值, 值...)
```

INSERT简写-按表的列顺序插入一行数据：

```sql
INSERT INTO <表> VALUES(值, 值...)
```

### SQL修改：UPDATE

```sql
UPDATE <表> SET 列名 = 值, 列名 = 值... 
[WHERE <修改条件>]
```

### SQL删除：DELETE

```sql
DELETE FROM <表> 
[WHERE <删除条件>]
```



# SQL DDL

DDL数据定义语言

## Oracle数据类型

- NUMBER：整数
- DATE：日期
- CLOB：大文本数据，可存4G文本数据
- BLOB：二进制数据，可存图片、音频、视频、文字，最大4G。
- VARCHAR：固定长度字符串，标准sql数据类型
- VARCHAR2：可变长度字符串，oracle特有。
  - 字符串：`'abc'`
  - 字符串连接符：`||`



## 表：TABLE

### 创建表

```mysql
CREATE TABLE <表名>(
    <列名> <数据类型> [<DEFAULT 默认值>] [<约束>],
    <列名> <数据类型> [<DEFAULT 默认值>] [<约束>],
    ...
    [CONSTRAINT <约束名> <约束类型>(约束列)]
)
```

### 修改表

修改表中列

1.增加列：

```mysql
ALTER TABLE <表名> ADD （
    <列名> <数据类型> [<DEFAULT 默认值>] [<列级约束>],
    <列名> <数据类型> [<DEFAULT 默认值>] [<列级约束>],
    ...
)
```

2.修改列：

```mysql
ALTER TABLE <表名> MODIFY （
    <列名> <数据类型> [<DEFAULT 默认值>] [<列级约束>],
    <列名> <数据类型> [<DEFAULT 默认值>] [<列级约束>],
    ...
)
```

3.删除列：

```mysql
ALTER TABLE <表名> DROP COLUMN <列名>
```

4.重命名列：

```mysql
ALTER TABLE <表名> RENAME <旧名> TO <新名>
```

修改表中属性：

1.添加约束：

```mysql
ALTER TABLE <表名> ADD CONSTRAINT <约束名> <约束类型>(约束列);
```

2.删除约束：

```mysql
ALTER TABLE <表名> DROP CONSTRAINT <约束名>;
```

### 删除表

1.删除表：

```sql
DROP TABLE <表名>
```

2.截断表：

```mysql
TRUNCATE TABLE <表名> ADD 
```

### 复制表

1.复制表的结构与数据：

```mysql
CREATE TABLE <表名> AS 
	SELECT <目标列表达式>
	FROM <表>
	WHERE <查询条件>
```

2.仅复制表的结构：`WHERE 1 = 2`

```mysql
CREATE TABLE <表名> AS 
	SELECT <目标列表达式>
	FROM <表>
	WHERE 1 = 2;
```

### 重命名

```mysql
RENAME <旧名称> TO <新名称>
```

### 数据伪列



## 视图：VIEW

视图 (VIEW)：虚拟表，不占物理空间。

### 创建视图

```mysql
CREATE [OR REPLACE] [FORCE] VIEW <视图名>
[(列名1, 列2,...)]
AS 
SELECT...
[WITH CHECK OPTION]
[WITH READ ONLY];
```

> FORCE：强制创建视图
> WITH CHECK OPTION：检查约束视图
> WITH READ ONLY：只读视图

### 删除视图

```mysql
DROP VIEW <视图名>
```

## 索引：INDEX

索引：加快查询速度

### 创建索引

```mysql
CREATE [UNIQUE] INDEX <索引名>
ON <表名> (<列名> [ASC | DESC], ... )
[INITRANS n]
[MAXTRANS n]
[PCTFREE n]
[TABLESPACE <表空间名>]
[STORAGE storage]
[NOSORT]
```

> UNIQUE：唯一索引
> INITRANS：初始事务入口数
> MAXTRANS：最大事务入口数
> PCTFREE：索引数据块空闲空间的百分比 
> NOSORT：不排序

###修改索引

重建索引

```mysql
ALTER INDEX <索引名> REBUILD;
```

合并索引

```mysql
ALTER INDEX <索引名> COALESCE;
```

### 删除索引

```mysql
DROP INDEX <索引名>
```



## 同义词：SYNONYM 

同义词：数据库对象的一个别名，操作权限不变，简化对象访问。

### 创建同义词

```mysql
CREATE [PUBLIC] SYNONYM <表名同义词>
FOR <用户>.<表名>
```

### 删除同义词

```mysql
DROP [PUBLIC] SYNONYM <同义词>
```

## 序列：SEQUENCE 

序列 (SEQUENCE)： 序列号生成器，为表中的行自动生成序列号，产生一组等间隔的数值(类型为数字)。不占用磁盘空间，占用内存。 

其主要用途是生成表的主键值，可以在插入语句中引用，也可以通过查询检查当前值，或使序列增至下一个值。

### 创建序列 

```mysql
CREATE SEQUENCE <序列名>
[INCREMENT BY n]
[START WITH n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE n | NOCACHE];
```

> INCREMENT BY：定义步长
> START WITH：定义序列初始值
> MAXVALUE / MINVALUE：定义序列最大值/最小值
> NOMAXVALUE：默认最值
> CYCLE / NOCYCLE：表示序列达到限定值后是否循环
> CACHE n：对序列进行内存缓冲，提前生成n个序号存入缓存，默认n=20
> NOCACHE：不对序列进行内存缓冲

### **序列的两个伪列**

- NEXTVAL：序列中的下一个有效值
- CURRVAL：序列当前值

### 修改序列

```mysql
ALTER SEQUENCE [<用户>.]<序列名>
[INCREMENT BY n]
[START WITH n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE n | NOCACHE];
```

### 删除序列

```mysql
DROP SEQUENCE <序列名>
```



# 约束

```mysql
CONSTRAINT <约束名> <约束类型>(约束列)
```

## 非空约束：NOT NULL

非空约束：NOT NULL

```sql
<列名> <数据类型> NOT NULL
```

## 唯一约束：UNIQUE

唯一约束：UNIQUE

```mysql
<列名> <数据类型> UNIQUE
```

```mysql
CONSTRAINT uk_属性 UNIQUE(属性);
```

## 主键约束：PRIMARY KEY

主键约束：PRIMARY KEY，非空+唯一

```mysql
CONSTRAINT pk_属性 PRIMARY KEY(属性);
```

联合主键：

```mysql
CONSTRAINT pk_属性 PRIMARY KEY(属性1,属性2,...);
```

## 检查约束：CHECK

```mysql
CONSTRAINT ck_属性 CHECK(属性 IN (值1,值2...))
```

```mysql
CONSTRAINT ck_属性 CHECK(属性 BETWEEN 值1 AND 值2)
```

## 外键约束：FOREIGN KEY

```mysql
CONSTRAINT fk_属性 FOREIGN KEY REFERENCES ON DELETE <CASCADE|SET NULL> 
```

# 授权

## 授予权限：GRANT

```mysql
GRANT <权限>
ON <对象类型> <对象名>
TO <用户>
[WITH GRANT OPTION]
```

> WITH GRANT OPTION：可传播权限，即将该权限再授予其他用户。

## 收回权限：REVOKE

```mysql
REVOKE <权限>
ON <对象类型> <对象名>
FROM <用户> [CASCADE|RESTRICT]
```

>CASCADE：级联
>RESTRICT：限定

## 角色：ROLE

角色(ROLE)：一组数据库操作权限的集合。

**1.创建角色**：

```mysql
CREATE ROLE <角色名>
```

**2.为角色授权**：

```mysql
GRANT <权限>
ON <对象类型> <对象名>
TO <角色>
```

**3.将角色授权给其他角色或用户**：

```mysql
GRANT <角色1>
ON <对象类型> <对象名>
TO <角色2>,<用户>
```