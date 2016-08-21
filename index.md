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
  font-family: 'Source Code Pro', monospace;
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

<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro:700" rel="stylesheet">

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
docker run [options] image[:tag] [command]
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

### How does a image being created?

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
* `COPY|ADD src des` : add file from context to image, [difference between COPY & ADD](http://stackoverflow.com/questions/24958140/docker-copy-vs-add)
* `CMD` : set default `docker run` command

[More about Dockerfile](https://docs.docker.com/engine/reference/builder/)

%%%%%%%%%%%%%%%
!SLIDE x=13500

## Build it!

```
docker build -t {image_name} {path_to_context}
```

%%%%%%%%%%%%%%%
!SLIDE x=15000

## Filesystem that stores changes

#### Shared Layers between images

#### Cached when build

%%%%%%%%%%%%%%%
!SLIDE x=16500

## Push! (Upload)

```
docker push {image}
```

#### `git` 再次表示被抄了

%%%%%%%%%%%%%%%
!SLIDE unclickable x=9000 rotate-y=-30 scale=6

%%%%%%%%%%%%%%%
!SLIDE picture center x=0 y=5000

![docker-compose](http://i.imgur.com/QY7Mav1.png)

### Multiple Containers and More automation

%%%%%%%%%%%%%%%
!SLIDE x=0 y=5700

## What if I need mysql/postgresql?

```
RUN apt-get install postgresql...?
```

%%%%%%%%%%%%%%%
!SLIDE x=0 y=6400

### `docker-compose`

* Features
  * No more annoying parameters, more automations
  * Multiple containers at the same time
  * Link containers together so they can 'compose'
* [How to install](https://docs.docker.com/compose/install/)
  * docker toolbox or native have already installed for you

%%%%%%%%%%%%%%%
!SLIDE x=0 y=7100

### The `docker-compose.yml`

```
version: '2'
services:
  services_1:
    ...services_settings...
  services_2:
    ...services_settings...
```

%%%%%%%%%%%%%%%
!SLIDE x=0 y=7800

### Service settings

* What image to run
  * `image: {image_name}`
  * `build: {path/to/context}`
* `ports`, `volumes`
* `command`
* `depends_on`, `environment`

#### [More settings](https://docs.docker.com/compose/compose-file/)

%%%%%%%%%%%%%%%
!SLIDE x=0 y=8500

## Let's use docker-compose to compose rails and postgres!

#### [Postgresql on dockerhub](https://hub.docker.com/_/postgres/)

%%%%%%%%%%%%%%%
!SLIDE x=0 y=9200

### Up!

* `config` to check if is correct
* `build`
* `up [service]` / `run {service}`
* `logs`
* `ps`, `kill`, `rm`

%%%%%%%%%%%%%%%
!SLIDE x=0 y=9900

## One more thing

#### One-off command, eg. `rails c`, `rake ...`

%%%%%%%%%%%%%%%
!SLIDE x=0 y=9900 z=-1250

## `entrypoint`

#### Use this to make rails allow other commands

%%%%%%%%%%%%%%%
!SLIDE unclickable x=0 y=6750 rotate-x=30 scale=6

%%%%%%%%%%%%%%%
!SLIDE center x=0 y=0 scale=10 z=1

### Thank you for listening

<br />
<br />
<br />
<br />
<br />
<br />

#### Indexes

[Install](#/step-7), [Hello Docker](#/step-9), [Docker Images](#/step-18), [Compose](#/step-27)

%% The End
%%%%%%%%%%%%%%%
