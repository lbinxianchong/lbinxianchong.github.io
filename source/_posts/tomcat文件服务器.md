---
title: tomcat文件服务器
date: 2019-08-12 17:40:29
tags: 
    - tomcat
    - 文件服务器
categories: #分类(分层)
    - 技术
    - tomcat
reward: false #是否开启打赏功能
comment: false #是否开启评论功能
#top: 1 #置顶层级(数字越大，优先级越高)
#repo: codefine | hexo-theme-mellow #用户名 | 仓库名
src: /img/a.jpg #主页摘要缩略图(外链以及相对资源均可)
---

由于tomcat部署与idea部署分为单独的服务器，分为2种情况部署

### 第一种：项目在idea的tomcat部署

![1565602055313](D:\git-repository\vnote-log\Vbijian\学习日记\其他\tomcat文件服务器.assets\1565602055313.png)

![1565602117231](D:\git-repository\vnote-log\Vbijian\学习日记\其他\tomcat文件服务器.assets\1565602117231.png)

![1565602192580](D:\git-repository\vnote-log\Vbijian\学习日记\其他\tomcat文件服务器.assets\1565602192580.png)

访问：http://127.0.0.1:8080/docsave

### 第2种：tomcat文件服务器

tomcat作为项目服务器时因为权限问题，只能访问Tomcat文件夹下的资源（例如：WEB-INF）。

在tomcat根目录/conf/server.xml中加入如下配置，即可访问指定的文件。

Tomcat 7.0\conf\server.xml 找到Host标签加入如下内容：

```
<Context path="/asset/docsave" docBase="D:\docsave"/>
```

或者

```
<Context path="/img" docBase="D:\docsave"/>
```

访问：http://127.0.0.1:8080/img