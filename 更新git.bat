@echo off
title ����git����github

echo �ű���ʼ��%date%%time%

echo ###################hexoԴ�ļ�����#################
::�Զ�����hexoԴ�ļ� hexo��֧
::rmdir /q /s  .deploy_git

git add .
git commit -m "�Զ�����-%date%"
git push origin hexo:hexo


echo �ýű������õ���GBK����ʱ����

echo �ű�������%date%%time%
pause