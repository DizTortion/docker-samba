#!/bin/bash

set -e

/usr/sbin/groupadd -g ${GROUP_ID:-1000} $CIFS_USERNAME
/usr/sbin/useradd -u ${USER_ID:-1000} -g ${GROUP_ID:-1000} --no-create-home -s /sbin/nologin $CIFS_USERNAME 

echo -ne "$CIFS_PASSWORD\n$CIFS_PASSWORD\n" | smbpasswd -a -s $CIFS_USERNAME

/usr/bin/testparm --suppress-prompt

exec "$@" < /dev/null
