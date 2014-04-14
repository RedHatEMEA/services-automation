#!/usr/bin/env bash

CREATE_FABRIC="fabric:create --new-user admin --new-user-password admin --wait-for-provisioning"

. ./common.sh

# enable logging
set +x

. ./kill-fuse.sh

echo "Clearing down intermediate karaf data directories"
rm -rf $FUSE_HOME/data/ $FUSE_HOME/instances/ $FUSE_HOME/processes/ $FUSE_HOME/lock

echo "Launching Fuse"

($FUSE_HOME/bin/start $1)

i=0.0
c=0
sleeptime=1

echo -n "Waiting for Fuse to become available..."
while [ $c -le 0 ]
do
    sleep $sleeptime
    i=$(echo $sleeptime | bc)
    echo -n .
    c=$($FUSE_HOME/bin/client -u admin -p admin help 2> /dev/null| grep fabric:create | wc -l)
done

. ./karaf.scripts

set -x

echo ""
echo "Deploy services to fuse"

#$FUSE_HOME/bin/client -u admin -p admin -r 60 "$CREATE_FABRIC"
#$FUSE_HOME/bin/client -u admin -p admin -r 60 "$DEPLOY_SCRIPT"
