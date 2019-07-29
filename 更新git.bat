@echo off
title 更新git推送github

echo 脚本开始于%date%%time%

echo ###################hexo源文件更新#################
::自动更新hexo源文件 hexo分支
::rmdir /q /s  .deploy_git

git add .
git commit -m "自动更新-%date%"
git push origin hexo:hexo


echo 该脚本编码用的是GBK，及时更新

echo 脚本结束于%date%%time%
pause