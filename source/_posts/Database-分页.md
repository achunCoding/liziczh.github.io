---
title: 分页
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

<!--# 分页-->

List分页

SQL语句分页

<!--more-->

## List分页

### subList()分页

直接使用方法`subList(int begin,int end)`实现分页。

## SQL语句分页

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
> pageSize：每页展示的数据行数。

### 分页语句

MySql使用`LIMIT`关键字实现分页：

```sql
select *
from <表/查询块>
limit [offset,] rows
```

> currentPage：当前页数。
> pageSize：每页展示的数据条数。


