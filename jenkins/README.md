### Preparazione

Struttura directory:

```bash
$ sudo mkdir -p /srv/jenkins/
$ sudo chown -R 1000:1000 /srv/jenkins/
```

### Run

Avviare il container:
```bash
$ docker-compose -f jenkins/docker-compose.yml up -d
```

### Test
Puntare il browser su URL:8080 e verificare.


### Aggiungere slave
Sullo slave.
Aggiungere utente jenkins:
```
$ adduser -m jenkins
```

Copiare la unit systemd di esempio in `/etc/systemd/system/`.

Scaricare il jar dal jenkins master e copiarlo ad esempio nella home dell'utente jenkins.
Copiare l'URL dal jenkins master e modificare la unit di esempio con i valori presi dal master.

Avviare lo slave:

```
$ systemctl daemon-reload
$ systemctl start jenkins-slave
```
