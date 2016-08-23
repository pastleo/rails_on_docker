#!/bin/bash
echo "This is just a step by step tutorial, don't run me."
exit

docker run -it -v $(pwd):/tmp -p 3000:3000 ruby bash

# inside docker
cd /tmp
gem install rails
rails new .
rails s # wtf?
apt-get update && apt-get install -y nodejs # nodejs is required...
rails s # rejected?
rails s -b 0.0.0.0 # works!

