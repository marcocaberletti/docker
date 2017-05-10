### Preparazione

Struttura directory:

```console
$ mkdir -p /srv/registry/{auth,certs,data,conf}
```
Copia dei certificati:

``` console
$ cp hostcert.pem hostkey.pem /srv/registry/certs
```

Creazione utente:
```console
$ docker run --entrypoint htpasswd registry:2 -Bbn username userpassword > /srv/registry/auth/htpasswd
```

### Configurazione

Su tutti i nodi che devono comunicare con la registry, aggiungere la CA come trusted creando una directory
con lo stesso nome dell'endpoint della registry
```console
$ mkdir -p /etc/docker/certs.d/$REGISTRY_HOST
```
copiare la chiave pubblica della CA come ca.crt
```console
$ curl https://...../igi-test-ca.pem > /etc/docker/certs.d/$REGISTRY_HOST/ca.crt
```
Riavviare Docker:
```console
$ systemctl restart docker
```

### Run

Avviare la registry:
```console
$ docker-compose -f docker-registry/docker-compose.yml up -d
```

### Test

Sulle macchine client verificare il login:
```console
$ docker login -u username -p userpassword -e user@example.it myregistry.domain.it
```

Push di un'immagine
```console
$ docker tag -f argus-pap-centos6 ${REGISTRY_HOST}/italiangrid/argus-pap-centos6
$ docker push ${REGISTRY_HOST}/italiangrid/argus-pap-centos6
```

Pull di un'immagine
```console
$ docker pull $REGISTRY_HOST/italiangrid/argus-pap-centos6
```

### Troubleshoot
In caso di errori SSL, copiare il certificato della CA anche nel poll di sistema e fare il rebuild:
```console
$ sudo cp /etc/grid-security/igi-test-ca.pem /etc/pki/ca-trust/source/anchors/
$ update-ca-trust
```
