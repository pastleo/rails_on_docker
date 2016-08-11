title: Rails on Docker
author: PastLeo @ 5xRuby

%%%%%%%%%%%%%%%%%%%
% Use '%' to comment or directive (ex:css below)
%%%%%%%%%%%%%%%%%%%
%% You can add some custom style rules here...

%css

.bg-when-present.active {
    background: rgba(59, 65, 62, 0.85);
    border-radius: 10px;
}

%end

%%%%%%%%%%%%%%%%%%%
%% occupation of scale=1:
%% x = 1200
%% y = 700
%% occupation of scale=2: [occupation of scale=1] * 2
%% x = 2400
%% y = 1400
%% occupation of scale=3: [occupation of scale=1] * 3
%% x = 3600
%% y = 2100
%% occupation of scale=4: [occupation of scale=1] * 4
%% ...
%% the location of one step (slide) is originated from the center!

%%%%%%%%%%%%%%%%%%%
%% Here we go...

%%%%%%%%%%%%%%%
!SLIDE x=0 y=0 scale=10

## Rails on Docker

#### PastLeo @ 5xRuby

%%%%%%%%%%%%%%%
!SLIDE center picture x=0 y=-7000 scale=10

### What is docker?

![docker](http://i.imgur.com/afEjiqM.png)

%%%%%%%%%%%%%%%
!SLIDE x=-3000 y=-4750 scale=2

## Virtualization

#### 分離環境，保持本機的乾淨

%%%%%%%%%%%%%%%
!SLIDE x=0 y=-4750 scale=2

## Lightweight

#### Containers running on a single machine share the same operating system kernel

#### 磁碟上/啟動上都很輕快

%%%%%%%%%%%%%%%
!SLIDE x=3000 y=-4750 scale=2

## Portability

#### 外送到府，取貨免付款

%%%%%%%%%%%%%%%
!SLIDE unclickable x=0 y=-7000 scale=10

%%%%%%%%%%%%%%%
!SLIDE picture center x=-12000 y=-7000 scale=10

![docker-in-vm](http://i.imgur.com/cYCs6e0.jpg)

### Installation

%%%%%%%%%%%%%%%
!SLIDE x=-12000 y=-7000 z=5000 scale=5

### Installation

#### [官方網站](https://www.docker.com/)

* For Mac or Windows
  * docker native
  * docker toolbox
* Linux
  * [https://get.docker.com](https://get.docker.com)

![docker-in-vm](http://i.imgur.com/cYCs6e0.jpg)

### Installation

%%%%%%%%%%%%%%%
!SLIDE picture center x=-7700 y=-9500 scale=4

![funny-sudo](http://i.stack.imgur.com/m1rI9.png)

### 權限管理

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-8500 scale=3

## 超人身份

#### `su <user>` / `sudo <command>` / `sudo su` / `visudo`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-8000 scale=3

## +人

#### `useradd <user_name>` / `adduser <user_name>`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-7500 scale=3

## [修改人(?](http://linux.vbird.org/linux_basic/0410accountmanager.php#usermod)

#### `usermod <option> <user_name>`

#### 把人加到群組裡面: `usermod -aG docker <user_name>`

%%%%%%%%%%%%%%%
!SLIDE picture center x=-7700 y=-5750 scale=4

![funny-file-permission](http://i.imgur.com/upsemfw.jpg)

### 檔案權限

##### `ls -l` => `drwxr-xr-x pastleo staff`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-4500 scale=3

## [把東西送人](http://linux.vbird.org/linux_basic/0210filepermission.php#chown)

#### `chown [-Rv] <user>[:<group>] <path>`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-4000 scale=3

## [可以做啥](http://linux.vbird.org/linux_basic/0210filepermission.php#chmod)

#### `chmod [-Rv] <mod> <path>`

%%%%%%%%%%%%%%%
!SLIDE picture center x=-16300 y=-9500 scale=4

![htop](http://i.imgur.com/qZcM1SL.png)

### 一些系統狀態

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-9350 scale=3

## 工作管理員

#### `ps` / `ps <-ef|aux> | grep <program>` / [more](http://www.thegeekstuff.com/2011/04/ps-command-examples/)

#### `kill [-9] <pid>` / `killall <program>`

#### `top` / `htop`

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-8450 scale=3

## 背景服務的控制

#### [`systemctl [status|start|stop|enable|disable] <service>`](http://luyaku.pixnet.net/blog/post/183362281-c6.5%E8%88%87c7%E7%9A%84%E4%B8%80%E4%BA%9B%E5%B7%AE%E7%95%B0%E8%88%87-systemctl-%E7%9A%84%E4%BB%8B%E7%B4%B9)

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-7950 scale=3

## 網路狀態

#### `ifconfig` (`ipconfig` on windows)

#### 有哪些程式在監聽 Port: `netstat -tenlp` 

%%%%%%%%%%%%%%%
!SLIDE picture center x=-16300 y=-6000 scale=4

![apt-get-wife](http://i.imgur.com/X3SNyeB.png)

### 安裝軟體 (for ubuntu and debian)

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-5200 scale=3

## 使用安裝包

#### `dpkg -i foo.deb` / [dpkg usage](http://maxubuntu.blogspot.tw/2010/04/dpkg.html)

#### 到下張投影片你就會忘了這件事了

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-4500 scale=3

## `apt-get <action> <options>` 

#### `apt-get update`

#### `apt-get cache search ...` (or google) / `apt-get install ...`

#### `apt-get remove ...`

#### `apt-get upgrade [...]`

%%%%%%%%%%%%%%%
!SLIDE unclickable center x=-12000 y=-7000 scale=10

%%%%%%%%%%%%%%%
!SLIDE x=-12000 y=-14000 scale=10

### 關於套件管理程式

#### 他們都大同小異，以下我把我所知道的列出來

* Linux systems:
    * ubuntu, debian: `apt-get` / `aptitude`
    * centos, redhat: `yum`
* 3rd-party made for Non-Linux system:
    * OSX: [`brew`](http://brew.sh/)
    * Windows: [`choco`](https://chocolatey.org/)

%%%%%%%%%%%%%%%
!SLIDE center x=-12000 y=-14000 z=-12500 scale=10

### for Programming languages

* Python: `pip`，通常伴隨 Python 一同安裝
* Ruby: `gem`，通常伴隨 Ruby 一同安裝
* NodeJs: `npm`，通常伴隨 NodeJS 一同安裝
* PHP: `composer`，和以上三者比較不同，[來這取得](https://getcomposer.org)

![npm-so-long](http://i.imgur.com/hwvxiO1.jpg)

%%%%%%%%%%%%%%%
!SLIDE center picture x=12000 y=-7000 scale=10

![docker](http://i.imgur.com/afEjiqM.png)

#### Docker

%%%%%%%%%%%%%%%
!SLIDE center picture x=16300 y=-9000 scale=4

![docker-in-vm](http://i.imgur.com/cYCs6e0.jpg)

### Installation

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=-7700 scale=3

## [https://get.docker.com/](https://get.docker.com/)

#### [其他作業系統](https://docs.docker.com/engine/installation/)

#### Docker 是 client-server 的，在 OSX 跟 Windows 上只有 client

%%%%%%%%%%%%%%%
!SLIDE center picture x=16300 y=-6000 scale=4

![hello-world](http://i.imgur.com/7YISj2P.jpg)

### Try `docker` / `docker run hello-world`

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=-4800 scale=3

### 體驗一下它的威力

#### `docker run -it centos`

#### `docker run -it node`

#### `docker run [options] <image>[:version] [command]`

#### [DockerHub](https://hub.docker.com/explore/)

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-10000 scale=4

## 更多 docker 指令

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-9500 scale=3

## 看 Docker 是不是好的

#### `docker info`

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-8500 scale=3

### Containers / Image

* `exec` / `run` 的差異
* containers:
    * `docker ps [-l]`
    * `docker kill <container>`
    * `docker rm <container>`
    * `docker commit <container> <new_image>`
* images:
    * `docker images`
    * `docker rmi <image>`

%%%%%%%%%%%%%%%
!SLIDE x=9000 y=-8500 scale=3

### / Resource

* resources:
    * `docker network ...`
    * `docker volume ...`

%%%%%%%%%%%%%%%
!SLIDE picture center x=7700 y=-6250 scale=3

![serious-pusheen](http://i.giphy.com/V2FgIJRv6Ykq4.gif)

#### 來點認真的

```
git clone https://github.com/NCHUIT/104B_devOps_docker.git
```

#### 接下來各位會在 `practice` 內操作

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-5000 scale=3

## 來架個 [聊天室 Chat](http://socket.io/demos/chat/)

1. [Node on Dockerhub](https://hub.docker.com/_/node/) 
2. 建立 `Dockerfile`, [Docs](https://docs.docker.com/engine/reference/builder/)
3. `docker build -t chat .` (`docker build --help` to see more)
4. `docker run -p 80:3000 chat`

%%%%%%%%%%%%%%%
!SLIDE unclickable x=12000 y=-7000 scale=10

%%%%%%%%%%%%%%%
!SLIDE picture center x=-12000 y=3000 scale=10

![docker-compose](http://i.imgur.com/QY7Mav1.png)

### Docker-compose

#### 使用 Docker 的好幫手

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=500 scale=4

## Installation

#### [Official Installation Guide](https://docs.docker.com/compose/install/)

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=1750 scale=3

### Docker-compose 大致使用流程

1. 撰寫 `docker-compose.yml`
2. `docker-compose config`, 確保 `docker-compose.yml` 是好der
3. `build`
4. `up [service]` / `run <service>`
5. `logs`
6. `ps` / `kill [service]` / `rm [-avf]`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=4000 scale=3

### 讓 Chat 更容易地使用吧

#### 建立 `docker-compose.yml`, 要用就用新版吧 (2):

```
version: '2'
services:
  services_1:
    ...設定值...
```

#### [頗多頗複雜的文件](https://docs.docker.com/compose/compose-file/)

#### `docker-compose up chat`

%%%%%%%%%%%%%%%
!SLIDE center picture x=-16300 y=1500 scale=4

![wordpress](http://i.imgur.com/Chf2yZ7.png)

### 用 Docker 架設 Wordpress

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=2200 scale=3

## [Dockerhub 上面可是有的](https://hub.docker.com/_/wordpress/)

#### Wordpress 會用到 mysql (mariadb), docker-compose 就很有用了

#### `docker-compose up [-d] wordpress`

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=3000 scale=3

## `command` / `entrypoint` 差異

#### `docker-compose run <service> [command_or_args]` 的 `[command_or_args]` 會接在 `entrypoint` 之後

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=3900 scale=3

## 來做個資料庫備份吧

#### 直接在 `docker-compose` 裡頭加上兩個 one-off command service

#### 需要把 container 跟 host 檔案系統打通，透過 `volumes`

%%%%%%%%%%%%%%%
!SLIDE unclickable x=-12000 y=3000 scale=10

%%%%%%%%%%%%%%%
!SLIDE center picture center x=12000 y=3000 scale=10

![nginx](http://i.imgur.com/UYHOARe.png)

### Nginx

#### 來幫我們做 vhost

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=1500 scale=4

### 我們來用 docker 來跑 nginx 吧XDD

* [Nginx on dockerhub](https://hub.docker.com/_/nginx/)
* 先來個 one-off service 把 `conf.d` 複製出來
  * 測試 `conf.d` 是否正確的 one-off service `test`: `command: nginx -t`
* 用 `volumes` 把 `conf.d` 內外打通
* `docker-compose up nginx`

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=4500 scale=4

### 建立我們自己的 vhost

* 建立我們的靜態網站 `web` 資料夾，並且打通內外打通
* 複製 nginx 的 `default.conf` 來改
  * `listen <port> [default_server]`
  * `server_name <vhost_domain>`
  * `location` => `root`, `index`, `deny`
* DNS (cloudflare / `/etc/hosts`) 把 domain 指向你的伺服器
* `docker-compose up nginx`

%%%%%%%%%%%%%%%
!SLIDE center picture x=7700 y=1500 scale=4

### 把 chat / wordpress 跟 nginx 串在一起

* 利用 `docker network` 以及 nginx 的 `reverse-proxy`
* `restart: always`
* [我們自己建立 network 讓 docker-compose 來使用](https://docs.docker.com/compose/networking/#using-a-pre-existing-network)
* 繼續複製 `default.conf` 來改

![apache-behind-nginx](http://i.imgur.com/iJfhQ1P.jpg)

%%%%%%%%%%%%%%%
!SLIDE center picture slide x=7700 y=1500 z=-5000 scale=3

### Proxy pass settings

```
# For websocket
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection "upgrade";

# Wordpress required headers
proxy_set_header X-Real-IP  $remote_addr;
proxy_set_header X-Forwarded-For $remote_addr;
proxy_set_header Host $host;
proxy_redirect off;

# Reverse-proxy
proxy_pass http://<the_magic_service_name>[:port];
```

%%%%%%%%%%%%%%%
!SLIDE center picture x=7700 y=4500 scale=4

### 啟動！

#### `cd chat; docker-compose up -d chat; cd ..`

#### `cd wordpress; docker-compose up -d wordpress; cd ..`

#### `cd nginx; docker-compose up -d nginx; cd ..`

![goooo](http://i.giphy.com/ZJyn5HEzW7THO.gif)

%%%%%%%%%%%%%%%
!SLIDE unclickable x=12000 y=3000 scale=10

%%%%%%%%%%%%%%%
!SLIDE center picture x=0 y=7000 scale=10

### 感謝大家，大家辛苦惹:w

#### 快速連結： [DevOps of Linux (Debian)](#/step-7) / [Docker](#/step-25) / [docker-compose](#/step-37) / [Nginx](#/step-46)

![nyan](http://i.giphy.com/Fo2s6HabbWVna.gif)

%% The End
%%%%%%%%%%%%%%%
