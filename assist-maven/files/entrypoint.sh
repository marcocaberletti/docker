#!/bin/sh

set -e

[ $UID -ne $MAVEN_UID ] && usermod --uid $UID maven
[ $GID -ne $MAVEN_UID ] && usermod --gid $GID maven

set -x

sudo -u maven -E "$@"
