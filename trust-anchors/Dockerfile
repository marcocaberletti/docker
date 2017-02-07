FROM centos:7

COPY files/EGI-trustanchors.repo /etc/yum.repos.d/
COPY files/igi-test-ca.repo /etc/yum.repos.d/

RUN yum -y install epel-release && yum -y update
RUN yum -y install igi-test-ca ca-policy-egi-core fetch-crl rsync

CMD fetch-crl && rsync -avu --no-owner --no-group /etc/grid-security/certificates/ /mnt/volume/
