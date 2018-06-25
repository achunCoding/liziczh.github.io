---
title: JDBC
comments: true
date: 2018-05-18 23:33:29
id: jdbc
tags:
- Java
- Database
categories: DataBase
toc: true
reward: true
copyright: true
---

<!--# JDBC-->

JDBC ( Java DataBase Connectivity ) 即Java数据库连接，用于执行SQL语句的Java API，为访问不同关系数据库提供了统一规范。

<!--more-->

## JDBC 简介

- JDBC API：提供了应用程序与 JDBC 管理器的连接，供开发人员连接数据库、执行SQL语句、获得结果。
- JDBC Driver API：提供了 JDBC 管理器与驱动程序的连接，供数据库厂商开发数据库驱动程序使用。

## JDBC API 组件

- **DriverManager**：此接口用于管理一系列数据库驱动程序。匹配连接使用通信子协议从Java应用程序请求相应的数据库驱动程序。识别JDBC在某个子协议的第一个驱动程序将被用来建立数据库连接。 
- Driver：此接口用于处理与数据库服务器的通信。很少直接直接使用驱动程序（Driver）对象，一般使用`DriverManager`中的对象。
- **Connection**：此接口拥有接触数据库的所有方法。连接对象表示通信上下文，即与数据库中的所有的通信是通过此唯一的连接对象。 
- **Statement**：创建该接口对象将SQL语句提交到数据库。
- **ResultSet**：保存使用`Statement`对象执行SQL查询的结果集，可迭代结果集。
- **SQLException**：用于处理发生在数据库应用程序中的错误。

## JDBC 连接数据库

**前提**：安装由数据库厂商提供的数据库驱动程序 (导入数据库驱动jar包)。

**JDBC 连接数据库步骤**：

1. 加载和注册驱动
2. 获取数据库连接
3. 执行sql语句
4. 处理结果集
5. 释放资源

**JDBC 简单示例代码**：

```java
public class JDBCDemo {
	public static void main(String[] args) {
		// 声明变量
		String driverClassName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql:///lizi";
		String ur = "root";
		String pwd = "root";
		Connection conn = null;
		Statement stat = null;
		ResultSet res = null;
		List<User> userList = new ArrayList<>();
		
		try {
			// 1.加载和注册驱动
			Class.forName(driverClassName);
			// 2.获取数据库连接
			conn = DriverManager.getConnection(url, ur, pwd);
			// 3.执行sql查询语句
			stat = conn.createStatement();
			String sql = " select * from user ";
			res = stat.executeQuery(sql);
			// 4.迭代处理结果集
			while(res.next()) {
				User user = new User();
				user.setId(res.getInt("id"));
				user.setUsername(res.getString("username"));
				user.setPassword(res.getString("password"));
				userList.add(user);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 5.关闭连接，释放资源
			try {
				// 释放结果集
				res.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					// 释放statement对象
					stat.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					try {
						// 关闭数据库连接
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
}
```



## JDBC 数据库连接

JDBC 数据库连接，根据数据库驱动程序获取数据库连接的 Connection 对象。

### 1.加载和注册驱动

#### 方法一：`DriverManager.registerDriver()` 

Oracle：

```java
// 注册Oracle驱动
Driver oracleDriver = new oracle.jdbc.driver.OracleDriver();
DriverManager.registerDriver(oracleDriver);
```

MySql：

```java
// 注册MySql驱动
Driver mysqlDriver = new com.mysql.jdbc.Driver();
DriverManager.registerDriver(mysqlDriver);
```

#### 方法二：`Class.forName()` 

Oracle：

```java
// 加载和注册Oracle驱动
String driverClassName = "oracle.jdbc.driver.OracleDriver";
Class.forName(driverClassName);
```

MySql：

```java
// 加载和注册MySql驱动
String driverClassName = "com.mysql.jdbc.Driver";
Class.forName(driverClassName);
```

> 推荐使用 `Class.forName()` 加载驱动。
>

### 2.获取数据库连接

#### `DriverManager.getConnection()` 获取数据库连接

Oracle：

```java
// 获取Oracle数据库连接
String url = "jdbc:oracle:thin:@192.168.124.15:1521:orcl";
String username = "scott";
String password = "tiger";
Connection conn = DriverManager.getConnection(url, username, password);
```

MySql：

```java
// 获取MySql数据库连接
String url = "jdbc:mysql://localhost:3306/lizi?useUnicode=true&characterEncode=utf8&useSSL=false"; 
String username = "root";
String password = "root";
Connection conn = DriverManager.getConnection(url, username, password);
```

#### 复用:使用*.properties配置文件

使用 `*.properties` 文件配置数据库属性

```properties
driverClassName=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@192.168.124.15:1521:orcl
username=scott
password=tiger
```

```properties
driverClassName=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/lizi
username=root
password=root
```

加载properties文件，获取属性值，获取数据库连接

```java
// 使用properties文件流获取属性值
InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream(String filepath);
Properties pro = new Properties();
pro.load(in);
// 获取Oracle数据库连接
String url = pro.getProperties("url");
String username = pro.getProperties("username");
String password = pro.getProperties("password");
Connection conn = DriverManager.getConnection(url, username, password);
```

## JDBC 执行SQL语句

### Statement 执行SQL语句

```java
// 创建Statement对象执行SQL语句
Statement stat = conn.createStatement();
String sql = " select * from \"user\" ";
// 获取SQL查询结果集
ResultSet res = stat.executeQuery(sql);
```

- `boolean execute (String sql)`：如果存在结果集，返回 `true` ；否则返回 `false` 。
- `int executeUpdate (String sql)`：执行SQL更新语句，返回受影响的行数。
- `ResultSet executeQuery(String sql)`： 执行SQL查询语句，返回查询结果集。

### PreparedStatement 预编译

为了防止SQL注入，采用 PreparedStatement 预编译SQL语句，使用 `?` 作为参数占位符，使用`setXXX(int parameterIndex, XXX x)` 动态填充参数。

```java
// 预编译
String sql = "select * from user where username = ? and password = ? ";
PreparedStatement pstat = conn.prepareStatement(sql);
// 根据'?'索引填充参数值
pstat.setString(1, "admin");
pstat.setString(2, "123456");
// 获取SQL查询结果集
ResultSet res = pstat.executeQuery(sql);
```

- setXXX(int paraIndex, XXX x)：根据 `?` 参数索引 (1,2,3...) 填充XXX类型的数据。

## JDBC 结果集

### ResultSet 结果集





## JDBC CURD



## JDBC 事务处理



## JDBC 批量处理



## JDBCUtils

```

```

## DataSource

DataSource数据库连接池

DBCP

C3P0

Druid

## DBUtils

QueryRunner



