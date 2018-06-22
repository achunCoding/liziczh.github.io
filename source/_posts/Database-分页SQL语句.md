---
title: Database | 分页SQL语句
comments: true
date: 2018-06-21 12:50:55
id: db-pagination
tags: 
- database
categories: Database
toc: true
reward: true
copyright: true
---

<!--# Database | 分页SQL语句-->

使用数据库SQL语句实现分页功能。

<!--more-->

### Oracle分页语句

Oracle使用`ROWNUM`伪列实现分页：

```sql
select * 
from ( 
  select "temp".*, ROWNUM "rn" 
  from  <表/查询块> "temp" 
  where ROWNUM <= currengPage * pageSize ) 
where "rn" > (currentPage-1) * pageSize
```

> currentPage：当前页数。
> pageSize：每页显示的数据条数。

### MySql分页语句

MySql使用`LIMIT`关键字实现分页：

```sql
select *
from <表/查询块>
limit [offset,] pageSize
```

> offset：开始的行数。
> pageSize：每页显示的数据条数。


