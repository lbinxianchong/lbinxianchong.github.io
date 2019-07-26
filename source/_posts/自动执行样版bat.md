---
title: 自动执行样版bat
date: 2019-07-26 16:13:06
tags:
---

该文档是自动执行样本

```
@echo off
title 更新git推送github

echo 脚本开始于%date%%time%

::路径设置
set vnotepath=D:\git-repository\vnote-log
set hexoblogpath=D:\note\blog\hexoblog
set githubpath=D:\note\blog\lbinxianchong.github.io

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

