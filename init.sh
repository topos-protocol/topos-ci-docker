#!/bin/bash
# source this in the shell
git config --global credential.https://github.com.username robot-toposware
export GIT_ASKPASS=/bin/git_env_password.sh
chmod +x $GIT_ASKPASS

install -d ~/.cargo
cp /cargo/config ~/.cargo/config
