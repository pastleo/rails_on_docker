
* What is docker?
* Installation
    * Mac or Windows
        * docker native
        * docker toolbox
    * Linux
        * [https://get.docker.com](https://get.docker.com)
* hello docker
    * docker run hello world
    * what the hell just happend?
    * docker pull ruby
    * docker run ruby with paramters
        * interactive mode: `-it`
    * docker run ruby with different version, [dockerhub](https://hub.docker.com/_/ruby/)
    * let's bootstrap a rails project
        * share volume with `-v ...`
        * expose port with `-p ...`
        * `docker run [options] <image> [command]`
        * `01-bootstrap-rails.sh`
    * `ps [-l|-a]` / `kill` / `rm`
* how a image is created
    * docker commit (git commit ..?)
    * Dockerfile -> docker build
        * create Dockerfile for the rails project just created
            * `FROM`, `RUN`, `WORKDIR`, `COPY` / `ADD`, `CMD`
        * the cache mechanism
    * docker push (git push ..?)
* I have a mysql/postgresql... 
    * `RUN apt-get install postgresql` ... NO
    * [postgresql](https://hub.docker.com/_/postgres/)
* docker-compose
    * benefit
        * no more annoying parameters, more automations
        * multiple containers at the same time
        * link containers together so they can 'compose'
    * installation
        * with docker native or toolbox, you have installed docker-compose already
        * `brew install docker-compose`
    * let's put postgresql and rails together
        * a `docker-compose.yml` file is required (show format)
    * add some 'command' service
        * rake
        * database dump / restore
        * entrypoint

