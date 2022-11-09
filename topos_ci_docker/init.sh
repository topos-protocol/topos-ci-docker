#!/bin/bash
# source this in the shell
echo PRIV_GH_USER=$PRIV_GH_USER
git config --global credential.https://github.com.username $PRIV_GH_USER

export GIT_ASKPASS=/bin/git_env_password.sh
export CARGO_NET_GIT_FETCH_WITH_CLI=true
chmod +x $GIT_ASKPASS
