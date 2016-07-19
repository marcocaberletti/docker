### Build
Fare build dell'immagine:

```bash
$ ./build-image.sh
```

### Run manuale
Run del container in background:

```bash
$ docker-compose -f zabbix-java-gateway/docker-compose.yml up -d
```

### Eseguire come servizio di sistema
Copiare la unit systemd
```bash
$ cp systemd/zabbix-java-gateway.service /usr/lib/systemd/system/zabbix-java-gateway.service
```

Ricare la configurazione di systemd:
```bash
$ systemd daemon-reload
```

Avviare il servizio
```bash
$ systemctl start zabbix-java-gateway
```