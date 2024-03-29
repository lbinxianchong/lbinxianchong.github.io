---
title: bat批处理命令说明
date: 2019-07-26 16:05:53
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
src: /img/as/1.jpg #主页摘要缩略图(外链以及相对资源均可)
---

#### 格式

```
@echo off
title 标题
echo 显示信息
pause
```

##### Echo 命令

```
echo [message]
```

显示[message]信息

```
echo off
```

echo off 表示在此语句后所有运行的命令都不显示命令行本身；默认是on，on时会显示如： C:\文件夹路径>命令行。

##### @ 命令

```
@
@echo off 
```

只能加在每个命令行的最前面，表示运行时不显示这一行的命令行(只能影响当前行)。

##### Rem 命令

```
Rem 注释
:: 注释
```

::或rem，起一个注释的作用

##### Pause 命令

```
Pause
```

会暂停批处理的执行并在屏幕上显示Press any key to continue...的提示，等待用户按任意键后继续

##### Call 命令

```
call="%cd%\xxx.bat" arg1 arg2 arg3 (调用指定目录下的 xxx.bat，且输入3个参数给他)
call xxx.bat arg1 arg2 (调用同目录下的 xxx.bat，且输入2个参数给他)
```

调用另一个批处理程序，并且不终止父批处理程序。

##### start 命令

```
start /MIN test2.bat arg1 arg2 (调用同目录下的 test2.bat，且输入2个参数给他，且本窗口最小化)
X:\"program files"\xxx\xxx.exe (文件路径名有空格时)
start /d "%cd%" xxx.exe（/d 按路径执行 注意空格）
```

调用外部程序，所有的 DOS命令 和 命令行程序 都可以由 start命令 来调用。

入侵常用参数：

| 参数       | 说明                                  |
| ---------- | ------------------------------------- |
| MIN        | 开始时窗口最小化                      |
| SEPARATE   | 在分开的空间内开始 16 位 Windows 程序 |
| HIGH       | 在 HIGH 优先级类别开始应用程序        |
| REALTIME   | 在 REALTIME 优先级类别开始应用程序    |
| WAIT       | 启动应用程序并等候它结束              |
| parameters | 这些为传送到命令/程序的参数           |

调用其他程序时，对文件的大小写不敏感，文件后缀也可忽略

##### If 命令

1. IF
2. if exist
3. if errorlevel number

 if [not] "参数" == "字符串" 待执行的命令

```
if {%1} == {} goto noparms
```

 if [not] exist [路径\]文件名 待执行的命令

```
if exist config.sys edit config.sys (表示如果存在这文件，则编辑它)
if exist config.sys type config.sys (表示如果存在这文件，则显示它的内容)
```

if [not] errorlevel <数字> 待执行的命令

```
IF ERRORLEVEL 1 (ECHO 失败) Else IF ERRORLEVEL 0 ECHO 成功
```

##### else

 if 条件 (成立时执行的命令) else (不成立时执行的命令)

```
 if 1 == 0 ( echo comment1 ) else if 1==0 ( echo comment2 ) ^

else (echo comment3 )
```

注：如果 else 的语句需要换行，if 执行的行尾需用“^”连接，并且 if 执行的动作需用(括起来)，否则报错

##### shutdown命令

```
shutdown -s 
```

关机

##### random 命令

产生随机数(正整数0~)

##### exit 命令

结束程序。即时是被调用的程序，结束后也不会返回原程序

#### 文件处理

```
rd /q /s x:\xxx\xxx
```

删除一个空目录

```
md x:\xxx\xxx
```

创建目录

##### 删除一个文件或多个文件

```
del /s /q /f x:\xxx\x.bat
```

将直接删除x:\xxx\x.bat，没有任务提示

```
del temp\* /q /f /s
```

将直接删除 本目录的 temp 目录的所有文件，没有任务提示

删除文件的时候可以使用“*”作通配符

##### 删除一个非空目录

```
rmdir /q /s x:\xxx\xxx
```

必须指定目录名称，不能使用通配符

/S 除目录本身外，还将删除指定目录下的所有子目录

/Q 安静模式，带 /S 删除目录树时不要求确认

无论里面是否有文件或文件夹将全部直接删除

##### XCOPY命令

XCOPY source [destination] [命令参数]

```
xcopy %cd%\xxx  %cd%\xxx /E/y
xcopy d:"mp3 e:"mp3 /s/e/i/y
```

复制 d:"mp3 文件夹、所有子文件夹和文件到 e:" ，覆盖已有文件

加 /i 表示如果 e:" 没有 mp3 文件夹就自动新建一个，否则会有询问

| XCOPY source [destination]        | [/A \| /M] [/D[:date]] [/P] [/S [/E]] [/V] [/W] 　　[/C] [/I] [/Q] [/F] [/L] [/G] [/H] [/R] [/T] [/U] 　　[/K] [/N] [/O] [/X] [/Y] [/-Y] [/Z] 　　[/EXCLUDE:file1[+file2][+file3]...] |
| --------------------------------- | ------------------------------------------------------------ |
| source                            | 指定要复制的文件。                                           |
| destination                       | 指定新文件的位置和/或名称。                                  |
| /A                                | 只复制有存档属性集的文件， 　　但不改变属性。                |
| /M                                | 只复制有存档属性集的文件， 　　并关闭存档属性。              |
| /D:m-d-y                          | 复制在指定日期或指定日期以后更改的文件。 　　如果没有提供日期，只复制那些源时间 　　比目标时间新的文件。 |
| /EXCLUDE:file1[+file2][+file3]... | 指定含有字符串的文件列表。每一个字符串 　　必须在文件的单独行中。如果有任何 　　字符串与要被复制的文件的绝对路径 　　相符，那个文件将不会得到复制。 　　例如，指定如 \obj\ 或 .obj 的字符串会排除 　　目录 obj 下面的所有文件或带有 　　.obj 扩展名的文件。 |
| /P                                | 创建每个目标文件前提示。                                     |
| /S                                | 复制目录和子目录，除了空的。                                 |
| /E                                | 复制目录和子目录，包括空的。与 /S /E 相同。可以用来修改 /T。 |
| /V                                | 验证每个新文件。                                             |
| /W                                | 提示您在复制前按键。                                         |
| /C                                | 即使有错误，也继续复制。                                     |
| /I                                | 如果目标不存在，又在复制一个以上的文件，则假定目标一定是一个目录。 |
| /Q                                | 复制时不显示文件名。                                         |
| /F                                | 复制时显示完整的源和目标文件名。                             |
| /L                                | 显示要复制的文件。                                           |
| /G                                | 允许将没有经过加密的文件复制到不支持加密的目标。             |
| /H                                | 也复制隐藏和系统文件。                                       |
| /R                                | 覆盖只读文件。                                               |
| /T                                | 创建目录结构，但不复制文件。 　　不包括空目录或子目录。/T /E 包括 　　空目录和子目录。 |
| /U                                | 只复制已经存在于目标中的文件。                               |
| /K                                | 复制属性。一般的 Xcopy 会重置只读属性。                      |
| /N                                | 用生成的短名复制。                                           |
| /O                                | 复制文件所有权和 ACL 信息。                                  |
| /X                                | 复制文件审核设置(隐含 /O)。                                  |
| /Y                                | 复制文件审核设置(隐含 /O)。 　　现存目标文件。 　　【就是直接覆盖——Three~注】 |
| /-Y                               | 导致提示以确认改写一个 　　现存目标文件。                    |
| /Z                                | 用重新启动模式复制网络文件。                                 |
|                                   | 命令行开关 /Y 可以预先在 COPYCMD 环境变量中设置。 　　这可能被命令行上的 /-Y 改写。 |
|                                   | /B 复制符号链接本身与链接目标相对。                          |
|                                   | /J 复制时不使用缓冲的 I/O。推荐复制大文件时使用。            |

时间

```
set "year=%date:~0,4%"
set "month=%date:~5,2%"
set "day=%date:~8,2%"
set "hour_ten=%time:~0,1%"
set "hour_one=%time:~1,1%"
set "minute=%time:~3,2%"
set "second=%time:~6,2%"
```

参考：https://blog.csdn.net/qq_36838191/article/details/83046599