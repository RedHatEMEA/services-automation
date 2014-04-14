#!/usr/bin/env bash

echo "Killing all karaf processes"
jps -l | grep karaf | cut -d ' ' -f 1 | xargs -n1 kill -kill
