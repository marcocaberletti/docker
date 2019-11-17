#!/bin/sh

set -xe

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
	listen ${PORT};
	server_name _;

	rewrite ^${HEALTH_PATH}$ ${HEALTH_TARGET};

	location / {
		proxy_pass http://${BACKEND};
	}
}
EOF

cat /etc/nginx/conf.d/default.conf
nginx -t
nginx -g 'daemon off;'
