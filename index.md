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

#impress code {
  font-family: 'Source Code Pro';
}

%end

<link href='https://fonts.googleapis.com/css?family=Source+Code+Pro:700' rel='stylesheet' type='text/css'>

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
!SLIDE picture center x=0 y=-12500 scale=5

![docker-in-vm](http://i.imgur.com/cYCs6e0.jpg)

### Installation

%%%%%%%%%%%%%%%
!SLIDE x=0 y=-12500 z=-7500 scale=5

### Installation

#### [官方網站](https://www.docker.com/)

* For Mac or Windows
  * [docker native](https://www.docker.com/products/docker)
  * [docker toolbox](https://www.docker.com/products/docker-toolbox)
* Linux
  * [https://get.docker.com](https://get.docker.com)

%%%%%%%%%%%%%%%
!SLIDE center picture x=-6000

![hello-world](http://i.imgur.com/7YISj2P.jpg)

### Hello Docker!

```
docker run hello-world
```

%%%%%%%%%%%%%%%
!SLIDE x=-7500

## What the hell just happened?

%%%%%%%%%%%%%%%
!SLIDE center picture x=-9000

![ruby](http://i.imgur.com/XjopV7U.png)

### 外帶 ruby

```
docker pull ruby
```

%%%%%%%%%%%%%%%
!SLIDE x=-10500

## 驗貨一下

```
docker run -it ruby
```

%%%%%%%%%%%%%%%
!SLIDE x=-12000

## 我要不同版本的

### [Dockerhub](https://hub.docker.com/)

### [Ruby on dockerhub](https://hub.docker.com/_/ruby/)

%%%%%%%%%%%%%%%
!SLIDE x=-13500

### docker run 參數

```
docker run [options] image[:version] [command]
```

* `-it` : interactive mode
* `-v host_path:container_path` : sharing volume
* `-p host_port:container_port` : exposing ports
* `docker run --help` to know more...

%%%%%%%%%%%%%%%
!SLIDE x=-15000

## Let's Bootstrap a rails project

#### 練習看看

%%%%%%%%%%%%%%%
!SLIDE x=-16500

## Useful docker commands

#### `ps [-l|-a]`, `kill`, `rm`

#### There are a lot more commands, just ask docker: `docker`

%%%%%%%%%%%%%%%
!SLIDE unclickable x=-9000 rotate-y=30 scale=6

%%%%%%%%%%%%%%%
!SLIDE center picture x=6000

![image](http://i.imgur.com/EY96Pon.png)

### How a image is created?

%%%%%%%%%%%%%%%
!SLIDE x=7500

## Commit! (Snapshot)

#### `docker commit container_id [image_name]` 

#### `git` 表示被抄了

%%%%%%%%%%%%%%%
!SLIDE x=9000

## image related commands

#### `images`, `rmi`

%%%%%%%%%%%%%%%
!SLIDE x=10500

## Automation?

#### `Dockerfile` => `docker build`

%%%%%%%%%%%%%%%
!SLIDE x=12000

### Let's create a Dockerfile for the rails project just created

* `FROM image` : base image
* `RUN command` : command to run
* `WORKDIR /path` : absolute path to `cd`
* `COPY|ADD src des` : add file from context to image
* `CMD` : set default `docker run` command

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-5000 scale=3

## The onbuild version


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
