::@echo off
title 更新hexo-本地部署
echo ###################hexoblog更新#################
CMD /C hexo clean
CMD /C hexo g
CMD /C hexo server

echo 该脚本编码用的是GBK，及时更新

pause