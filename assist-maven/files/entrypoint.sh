#!/bin/sh

set -e

[ $UID -ne $MAVEN_UID ] && usermod --uid $UID --gid $GID maven

set -x

sudo -u maven -E "$@"
