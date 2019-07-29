---
title: 自动执行样版bat
date: 2019-07-26 16:13:06
tags: 
    - bat
    - 批处理
categories: #分类(分层)
    - 技术
    - 批处理
reward: false #是否开启打赏功能
comment: false #是否开启评论功能
#top: 1 #置顶层级(数字越大，优先级越高)
#repo: codefine | hexo-theme-mellow #用户名 | 仓库名
src: /img/a.jpg #主页摘要缩略图(外链以及相对资源均可)
---

打开执行

```
@echo off
::路径设置
set ideapath=D:\Program Files\JetBrains\IntelliJ IDEA 2017.3.2\bin\
set vnotepath=D:\Program Files (x86)\VNote\
::执行程序
start /d "%vnotepath%" VNote.exe
start /d "%ideapath%" idea64.exe
echo 该脚本编码用的是GBK，及时更新
pause
```

hexo编译

```
@echo off
title 更新hexo-本地部署
echo ###################hexoblog更新#################
CMD /C hexo clean
CMD /C hexo g

echo 该脚本编码用的是GBK，及时更新

pause
```

一键git更新github

```
@echo off
title 更新git推送github

echo 脚本开始于%date%%time%

::路径设置
set vnotepath=x:\xx\x
set hexoblogpath=x:\xx\x
set githubpath=x:\xx\x

echo ###################vnote笔记更新#################
::更新笔记 vnote-log master
cd /d %vnotepath%
echo %vnotepath%
git add .
git commit -m "自动更新-%date%"
git push origin master:master

echo ###################hexoblog更新#################
::自动部署hexo博客 master分支
cd /d %githubpath%
echo %githubpath%
CMD /C hexo clean
CMD /C hexo g
CMD /C hexo d

echo ###################hexo源文件更新#################
::自动更新hexo源文件 hexo分支
cd /d %githubpath%
echo %githubpath%
rmdir /q /s  %githubpath%\.deploy_git

git add .
git commit -m "自动更新-%date%"
git push origin hexo:hexo


echo 该脚本编码用的是GBK，及时更新

echo 脚本结束于%date%%time%
pause
```

