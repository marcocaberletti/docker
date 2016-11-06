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
