---
title: Ubuntu配置设置
date: 2020-06-12 17:40:29
tags: 
    - Ubuntu
    - 服务器
categories: #分类(分层)
    - 技术
    - 操作系统
reward: false #是否开启打赏功能
comment: false #是否开启评论功能
#top: 1 #置顶层级(数字越大，优先级越高)
#repo: codefine | hexo-theme-mellow #用户名 | 仓库名
#src: /img/a.jpg #主页摘要缩略图(外链以及相对资源均可)
---

# 1.dockor篇

#### 卸载老版本

```sh
$ sudo apt-get remove docker docker-engine docker.io
```

#### 更新apt包索引

```sh
sudo apt-get update
```

#### 安装包以允许通过HTTPS使用存储库：

```sh
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

#### 添加Docker的官方GPG密钥：

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

通过搜索指纹的最后8个字符，确认您现在拥有指纹9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88的密钥。

```sh
sudo apt-key fingerprint 0EBFCD88

pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```

##### *使用以下命令设置稳定存储库。即使您还想从边缘或测试存储库安装构建，您始终需要稳定的存储库。要添加边缘或测试存储库，请在以下命令中的单词stable之后添加单词edge或test（或两者）。

- 注意
   注意：下面的lsb_release -cs子命令返回Ubuntu发行版的名称，例如xenial。有时，在像Linux Mint这样的发行版中，您可能需要将$（lsb_release -cs）更改为您的父Ubuntu发行版。例如，如果您使用的是Linux Mint Rafaela，则可以使用trusty。

```sh
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

- 注意：从Docker 17.06开始，稳定版本也会被推送到边缘并测试存储库。
- **注意：可以不需要，暂时使用，服务器请选择国内比较好。**

### 安装DOCKER CE

#### 更新apt包索引。

```sh
sudo apt-get update
```

#### 安装最新版本的Docker CE，或转到下一步安装特定版本：

```sh
sudo apt-get install docker-ce
```

##### *要安装特定版本的Docker CE，请列出repo中的可用版本，然后选择并安装：

- 列出您的仓库中可用的版本：

```sh
apt-cache madison docker-ce
```

- 通过其完全限定的包名称安装特定版本，即包名称（docker-ce）“=”版本字符串（第2列），例如，docker-ce = 18.03.0ce-0ubuntu。

```sh
sudo apt-get install docker-ce=<VERSION>
```

#### 查看Docker CE 版本

```sh
docker -v 
```

#### 通过运行hello-world映像验证是否正确安装了Docker CE。

```sh
sudo docker run hello-world
```

Docker CE已安装并正在运行。已创建docker组，但未向其添加任何用户。您需要使用sudo来运行Docker命令。继续Linux postinstall以允许非特权用户运行Docker命令和其他可选配置步骤。

### 更新

升级DOCKER CE要升级Docker CE，首先运行sudo apt-get update，然后按照安装说明选择要安装的新版本。

```sh
sudo apt-get update
```

# 2.Portainer篇

**利用Docker拉取portainer镜像**

```java
docker pull portainer/portainer
```

运行启动portainer

```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

# 3.cockpit篇

```
sudo apt install cockpit
```

##### 防火墙功能，安装firewalld

```
sudo apt install firewalld
```

##### 虚拟机管理功能，安装cockpit-machines

```
sudo apt install cockpit-machines
```

##### 容器管理功能，安装cockpit-podman

```
sudo apt install cockpit-podman
sudo apt install cockpit-docker
```

##### *Ubuntu 20.04暂时没有该包cockpit-podman cockpit-docker

```
sudo systemctl start cockpit
```



#### 参考资料：

#### https://www.jianshu.com/p/83483c35bfcd

#### https://docs.docker.com/engine/install/ubuntu/

#### http://www.senra.me/docker-management-panel-series-portainer/

#### https://baijiahao.baidu.com/s?id=1666118979367180810&wfr=spider&for=pc

#### https://linux.cn/article-8473-1.html