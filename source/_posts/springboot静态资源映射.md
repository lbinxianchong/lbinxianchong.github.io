---
title: springboot静态资源映射
date: 2019-12-23 16:13:06
tags: 
    - spring
    - spingboot
categories: #分类(分层)
    - 技术
    - spring
reward: false #是否开启打赏功能
comment: false #是否开启评论功能
#top: 1 #置顶层级(数字越大，优先级越高)
#repo: codefine | hexo-theme-mellow #用户名 | 仓库名
src: /img/a.jpg #主页摘要缩略图(外链以及相对资源均可)
---
打开执行

找了大半个文章没一个有干货

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

```java
@Configuration
public class FileServerConfig implements WebMvcConfigurer {

    //访问图片方法
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //查询os系统
        //String name = SystemUtil.getOsInfo().getName();

        if (getAssetFileServerPath().equals("ftp")) {
            registry.addResourceHandler("/file/**")
                    .addResourceLocations("http://127.0.0.1:8080");
        } else if (getAssetFileServerPath().equals("local")) {
            registry.addResourceHandler("file/**")
                    .addResourceLocations("file:F:/flie/");
        } else if (getAssetFileServerPath().equals("classpath")) {
            //项目路径资源无需设置
            registry.addResourceHandler("/file/**")
                    .addResourceLocations("classpath:/file/");
        } else {
            //无需设置
            registry.addResourceHandler("/file/**")
                    .addResourceLocations("classpath:/file/");
            		.addResourceLocations("file:F:/flie/");
            		.addResourceLocations("http://127.0.0.1:8080");
        }


        // 本地文件夹要以"flie:" 开头，文件夹要以"/" 结束
        //windown
        //file:F:/flie/
        //其他
        //file:/flie/
        // 项目文件夹要以"classpath:" 开头，文件夹要以"/" 结束
        //classpath:/file/
        // url没有限制，前缀可以有url文件服务器的编码[charset=UTF-8]
        //https://example.org/path
        //[charset=UTF-8]https://example.org/path
       
    }
}
```


