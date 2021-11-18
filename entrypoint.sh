#!/bin/sh

set -e

/usr/sbin/addgroup --gid ${GROUP_ID:-1000} $CIFS_USERNAME
/usr/sbin/adduser --uid ${USER_ID:-1000} --ingroup $CIFS_USERNAME --no-create-home --shell /sbin/nologin --disabled-password $CIFS_USERNAME

echo -ne "$CIFS_PASSWORD\n$CIFS_PASSWORD\n" | smbpasswd -a -s $CIFS_USERNAME

/usr/bin/testparm --suppress-prompt

exec "$@" < /dev/null
