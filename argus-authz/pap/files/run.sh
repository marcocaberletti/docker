#!/bin/bash

set -xe

PAP_LIBS=/usr/share/argus/pap/lib

# Configure
cert_dir="/etc/grid-security"

mkdir -p "${cert_dir}/certificates" 

if [ ! -f ${cert_dir}/hostkey.pem ] || [ ! -f ${cert_dir}/hostcert.pem ]; then
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	  -subj "/CN=${HOSTNAME}" \
	  -keyout "${cert_dir}/hostkey.pem" \
	  -out "${cert_dir}/hostcert.pem"
	
	chmod 0400 "${cert_dir}/hostkey.pem"
	chmod 0644 "${cert_dir}/hostcert.pem"
fi

envsubst < /tmp/argus-pap.tmpl > /etc/sysconfig/argus-pap
envsubst < /tmp/pap-admin.properties.tmpl > /etc/argus/pap/pap-admin.properties
envsubst < /tmp/pap_configuration.ini.tmpl > /etc/argus/pap/pap_configuration.ini

# Run
source /etc/sysconfig/argus-pap

ln -s /dev/stdout /var/log/argus/pap/pap-standalone.log

LOCALCP=`ls $PAP_LIBS/provided/*.jar | xargs | tr ' ' ':'`
CLASSPATH=$LOCALCP:`ls $PAP_LIBS/*.jar | xargs | tr ' ' ':'`

java $PAP_JAVA_OPTS -DPAP_HOME=$PAP_HOME \
	 -Djava.endorsed.dirs=$PAP_LIBS/endorsed \
	 -cp $CLASSPATH:$PAP_HOME/conf/logging/standalone \
	 org.glite.authz.pap.server.standalone.PAPServer \
	 --conf-dir $PAP_HOME/conf
