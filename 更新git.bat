@echo off
title ����git����github

echo �ű���ʼ��%date%%time%

::·������
set vnotepath=D:\git-repository\vnote-log
set hexoblogpath=D:\note\blog\hexoblog
set githubpath=D:\note\blog\lbinxianchong.github.io

echo ###################vnote�ʼǸ���#################
::���±ʼ� vnote-log master
cd /d %vnotepath%
echo %vnotepath%
git add .
git commit -m "�Զ�����-%date%"
git push origin master:master

echo ###################hexoblog����#################
::�Զ�����hexo���� master��֧
cd /d %githubpath%
echo %githubpath%
CMD /C hexo clean
CMD /C hexo g
CMD /C hexo d

echo ###################hexoԴ�ļ�����#################
::�Զ�����hexoԴ�ļ� hexo��֧
cd /d %githubpath%
echo %githubpath%
rmdir /q /s  %githubpath%\.deploy_git

git add .
git commit -m "�Զ�����-%date%"
git push origin hexo:hexo


echo �ýű������õ���GBK����ʱ����

echo �ű�������%date%%time%
pause