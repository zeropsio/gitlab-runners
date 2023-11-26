#!/bin/bash

# Install latest GO 19 version
curl https://dl.google.com/go/go1.19.13.linux-amd64.tar.gz | tar -xzf - -C /usr/lib

runnerHome=/home/gitlab-runner

mkdir -p "$runnerHome"/go/bin

{
  echo 'export GOPATH=$HOME/go'
  echo 'export PATH=$PATH:~/bin:/usr/lib/go/bin:$GOPATH/bin'
} >> "$runnerHome"/.bashrc

{
  echo 'export GOPATH=$HOME/go'
  echo 'export PATH=$PATH:~/bin:/usr/lib/go/bin:$GOPATH/bin'
} >> "$runnerHome"/.profile

source "$runnerHome"/.bashrc
source "$runnerHome"/.profile
