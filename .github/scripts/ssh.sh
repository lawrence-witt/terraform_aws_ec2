#!/bin/bash

mkdir -p ~/.ssh/
echo "$PRIVATE_KEY" > ~/.ssh/private.key
chmod 600 ~/.ssh/private.key
cat >>~/.ssh/config <<END
Host proxy
    HostName $PROXY_HOST
    User $SSH_USER
    IdentityFile ~/.ssh/private.key
    StrictHostKeyChecking no
Host target
    HostName $TARGET_HOST
    User $SSH_USER
    IdentityFile ~/.ssh/private.key
    StrictHostKeyChecking no
END