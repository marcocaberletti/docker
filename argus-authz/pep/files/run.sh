#!/bin/bash

set -xe

PEP_HOME=/usr/share/argus/pepd
PEP_LIBS=$PEP_HOME/lib

# Configure
cert_dir="/etc/grid-security"

mkdir -p "${cert_dir}/certificates"
mkdir -p "${cert_dir}/gridmapdir"

if [ ! -f ${cert_dir}/hostkey.pem ] || [ ! -f ${cert_dir}/hostcert.pem ]; then
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	  -subj "/CN=${HOSTNAME}" \
	  -keyout "${cert_dir}/hostkey.pem" \
	  -out "${cert_dir}/hostcert.pem"
	
	chmod 0400 "${cert_dir}/hostkey.pem"
	chmod 0644 "${cert_dir}/hostcert.pem"
fi

envsubst < /tmp/argus-pepd.tmpl > /etc/sysconfig/argus-pepd
envsubst < /tmp/pepd.ini.tmpl > /etc/argus/pepd/pepd.ini

# Run
source /etc/sysconfig/argus-pepd

ln -s /dev/stdout /var/log/argus/pepd/access.log
ln -s /dev/stdout /var/log/argus/pepd/process.log
ln -s /dev/stdout /var/log/argus/pepd/audit.log

LOCALCP=/usr/share/java/argus-pdp-pep-common.jar:/usr/share/java/argus-pep-common.jar:`ls $PEP_LIBS/provided/*.jar | xargs | tr ' ' ':'`
CLASSPATH=$LOCALCP:`ls $PEP_LIBS/*.jar | xargs | tr ' ' ':'`

java -Dorg.glite.authz.pep.home=${PEP_HOME} \
	 -Dorg.glite.authz.pep.confdir=${PEP_HOME}/conf \
	 -Dorg.glite.authz.pep.logdir=${PEP_HOME}/logs \
	 -Djava.endorsed.dirs=${PEP_HOME}/lib/endorsed \
	 -classpath ${CLASSPATH} \
	 ${PEPD_JOPTS} ${PEPD_START_JOPTS} \
	 org.glite.authz.pep.server.PEPDaemon $PEP_HOME/conf/pepd.ini
