#!/bin/bash

set -xe

envsubst < /etc/kibana/kibana.tmpl > /etc/kibana/kibana.yml

/usr/share/kibana/bin/kibana -c /etc/kibana/kibana.yml