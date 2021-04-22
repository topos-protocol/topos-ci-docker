#!/bin/bash

set -e -u -o pipefail

cd $GITHUB_WORKSPACE

echo "Run: $*"

git config credential.https://github.com.username robot-toposware

export GIT_ASKPASS=/bin/git_env_password.sh

git clone https://github.com/ToposWare/runtime-benchmark-bot.git
bash -c "$*"
