#!/bin/bash

set -xe

PDP_HOME=/usr/share/argus/pdp
PDP_LIBS=$PDP_HOME/lib

# Configure
cert_dir="/etc/grid-security"

if [ ! -f ${cert_dir}/hostkey.pem ] || [ ! -f ${cert_dir}/hostcert.pem ]; then
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	  -subj "/CN=${HOSTNAME}" \
	  -keyout "${cert_dir}/hostkey.pem" \
	  -out "${cert_dir}/hostcert.pem"
	
	chmod 0400 "${cert_dir}/hostkey.pem"
	chmod 0644 "${cert_dir}/hostcert.pem"
fi

envsubst < /tmp/argus-pdp.tmpl > /etc/sysconfig/argus-pdp
envsubst < /tmp/pdp.ini.tmpl > /etc/argus/pdp/pdp.ini

# Run
source /etc/sysconfig/argus-pdp

ln -s /dev/stdout /var/log/argus/pdp/access.log
ln -s /dev/stdout /var/log/argus/pdp/process.log
ln -s /dev/stdout /var/log/argus/pdp/audit.log

LOCALCP=/usr/share/java/argus-pdp-pep-common.jar:`ls $PDP_LIBS/provided/*.jar | xargs | tr ' ' ':'`
CLASSPATH=$LOCALCP:`ls $PDP_LIBS/*.jar | xargs | tr ' ' ':'`

java -Dorg.glite.authz.pdp.home=$PDP_HOME \
	 -Dorg.glite.authz.pdp.confdir=$PDP_HOME/conf \
	 -Dorg.glite.authz.pdp.logdir=$PDP_HOME/logs \
	 -Djava.endorsed.dirs=$PDP_HOME/lib/endorsed \
	 -classpath $CLASSPATH \
	 $PDP_JOPTS $PDP_START_JOPTS \
	 org.glite.authz.pdp.server.PDPDaemon $PDP_HOME/conf/pdp.ini