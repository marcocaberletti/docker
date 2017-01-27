#!/bin/bash

mkdir -p /var/lib/forge/modules /var/lib/forge/cache

puppet-forge-server --proxy https://forgeapi.puppetlabs.com --module-dir /var/lib/forge/modules --cache-basedir /var/lib/forge/cache