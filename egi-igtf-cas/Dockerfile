FROM centos:7

ENV BUNDLE_DEST_DIR=/usr/src/bundle

COPY files/EGI-trustanchors.repo /etc/yum.repos.d/

RUN yum -y install ca-policy-egi-core && \
	yum clean all

RUN cp /etc/grid-security/certificates/*.pem /etc/pki/ca-trust/source/anchors/

CMD update-ca-trust && \
	mkdir -vp ${BUNDLE_DEST_DIR} && \
	cp -v /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem ${BUNDLE_DEST_DIR}
