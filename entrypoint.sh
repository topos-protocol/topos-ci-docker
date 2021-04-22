#!/bin/bash

set -e -u -o pipefail

cd $GITHUB_WORKSPACE

echo "Run: $*"

git config --global credential.https://github.com.username robot-toposware

export GIT_ASKPASS=/bin/git_env_password.sh
chmod +x $GIT_ASKPASS

install -d ~/.cargo
cp /cargo/config ~/.cargo/config
# debug:
echo HELLO WORLD
git clone https://github.com/ToposWare/runtime-benchmark-bot.git
find runtime-benchmark-bot


bash -c "$*"
