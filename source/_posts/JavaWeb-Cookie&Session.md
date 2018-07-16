---
title: JavaWeb | Cookie&Session
comments: true
date: 2018-07-16 20:45:55
id: javaweb-CookieAndSession
tags: 
- JavaWeb
categories: JavaWeb
toc: true
reward: true
copyright: true
---

<!--# Java会话与状态管理-->

由于 HTTP 是一种**无状态**协议，浏览器每一次请求都是独立的，无法维持客户端与Web 服务器之间的会话状态，所以引入**会话跟踪**技术，即 **Cookie** 和 **Session** 机制。

Web 应用中的**会话**指一个客户端浏览器与 Web 服务器之间连续发生的一系列请求与响应过程。**会话状态**指 Web 服务器与浏览器在会话过程中产生的状态信息。**SessionID** 用于唯一地标识一个会话的请求信息。

<!--more-->

## Cookie 机制

Cookie 机制采用在客户端保持 HTTP 状态信息的方法实现会话跟踪。

Cookie 是在浏览器访问 Web 服务器时，Web 服务器在 **HTTP 响应头**中附带的一个小文本文件，存储在客户端上，保留了各种跟踪信息。

Cookie 工作流程：①服务器脚本向浏览器发送一组 Cookie；②浏览器将这些信息存储在本地计算机上；③当下一次浏览器向 Web 服务器发送请求时，浏览器会将这些 Cookie 信息发送到服务器，服务器通过这些 Cookie 信息识别用户。

Cookie底层原理：Web 服务器在 HTTP 响应中增加 `Set-Cookie` 响应头字段将 Cookie 发送给浏览器；浏览器通过在 HTTP 请求中增加 Cookie 请求头字段将 Cookie 回传给服务器。

会话Cookie与持久Cookie：

会话Cookie保存在内存中，持久Cookie保存在磁盘中

### Servlet Cookie 

**Cookie 类**：

- `Cookie(String name, String value)` - Cookie 构造方法
- `getName()` - 获取 Cookie name
- `getValue()` 和 `setValue(String value)`  - 获取/设置 Cookie Value
- `getMaxAge()` 和 `setMaxAge(int expiry)` - 获取/设置 Cookie 最大生存周期
- `getPath()` 和 `setPath(String url)` - 获取/设置 Cookie 适用路径

**HttpServletResponse 添加 Cookie 到 HTTP 响应头中**：

```java
void response.addCookie(Cookie cookie)
```

**HttpServletRequest 获取当前请求的所有 Cookie**：

```java
Cookie[] request.getCookie()
```

### Cookie应用

#### 自动登陆

## Session

SessionID保存在Cookie中。

Session会话，保存在服务端，客户端只存在一个sessionID信息。

一般将jsp页面放在WEB-IFO下。



常用方法：

获取SessionID：

设置最大有效时间：

使session失效：invalidate()



### Session销毁：

- invalidate()
- 服务器卸载应用



### 利用URL重写实现session跟踪

当cookie被禁用时，如何跟踪session？

URL重写技术：将会话标识号以参数形式附加在URL地址后面

HttpServletResponse接口的方法：

- `encodeURL()`
- `encodeRedirectURL()`

URL重写实例：

```jsp
<a herf= <%=response.encodeURL("/hello_2.jsp")%> >hello_2.jsp</a>
```

### 绝对路径

获取项目根目录的绝对路径：

- `request.getContextPath()`
- `application.getContextPath()`

绝对路径写法：

```jsp
<a herf= request.getContextPath() + "/hello_2.jsp" >hello_2.jsp</a>
```



### Session应用

#### 防止表单多次提交

token对比

#### 购物车



#### 一次性验证码











