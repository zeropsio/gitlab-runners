#!/bin/bash

cd "$HOME" || exit 1

rm -f .bash_logout

mkdir -p ~/bin
mkdir -p ~/.ssh && chmod 0700 ~/.ssh

[ -n "$SSH_KEY" ] && echo "$SSH_KEY" > ~/.ssh/id_rsa
[ -n "$SSH_CONFIG" ] && echo "$SSH_CONFIG" > ~/.ssh/config
chmod 0600 ~/.ssh/*

[ -n "$GIT_CONFIG" ] && echo "$GIT_CONFIG" > ~/.gitconfig
