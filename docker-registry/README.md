### Preparazione

Struttura directory:

```bash
$ mkdir -p /srv/registry/{auth,certs,data}
```
Copia dei certificati:

``` bash
$ cp hostcert.pem hostkey.pem /srv/registry/certs
```

Creazione utente:
```bash
$ docker run --entrypoint htpasswd registry:2 -Bbn username userpassword > /srv/registry/auth/htpasswd
```

### Configurazione

Su tutti i nodi che devono comunicare con la registry, aggiungere la CA come trusted creando una directory
con lo stesso nome dell'endpoint della registry
```bash
$ mkdir -p /etc/docker/certs.d/$REGISTRY_HOST
```
copiare la chiave pubblica della CA come ca.crt
```bash
$ curl https://...../igi-test-ca.pem > /etc/docker/certs.d/$REGISTRY_HOST/ca.crt
```
Riavviare Docker:
```bash
$ systemctl restart docker
```

### Run

Avviare la registry:
```bash
$ docker-compose -f docker-registry/docker-compose.yml up -d
```

### Test

Sulle macchine client verificare il login:
```bash
$ docker login -u username -p userpassword -e user@example.it myregistry.domain.it
```

Push di un'immagine
```bash
$ docker tag -f argus-pap-centos6 ${REGISTRY_HOST}/italiangrid/argus-pap-centos6
$ docker push ${REGISTRY_HOST}/italiangrid/argus-pap-centos6
```

Pull di un'immagine
```bash
$ docker pull $REGISTRY_HOST/italiangrid/argus-pap-centos6
```