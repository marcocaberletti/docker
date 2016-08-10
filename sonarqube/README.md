### Preparazione

Struttura directory:

```bash
$ mkdir -p /srv/sonarqube/{conf,data,extensions,lib/bundled-plugins}
```

### Configurazione

Dare il grant all'utente sonar per connettersi al DB dalla rete di Docker:
```sql
mysql> grant all privileges on sonar.* to 'sonar'@'172.18.%.%' identified by 'xxxxxx';
mysql> flush privileges;
```
Verificare anche eventuali regole iptables.

### Run

Avviare il container col server Sonar:
```bash
$ docker-compose -f sonarqube/docker-compose.yml up -d
```

### Test

Verificare che la webapp risponda all'URL.
Verificare lo scan di un progetto.


### Upgrade
Fermare il container, rimuovere l'immangine nella cache locale e riavviere il container:
```bash
$ docker-compose -f sonarqube/docker-compose.yml stop
$ docker rmi sonarqube
$ docker-compose -f sonarqube/docker-compose.yml up --build -d
```

Puntare il browser su http://host:9000/setup ed eseguire la migrazione del DB.

In caso di upgrade della major release, es. da 5.6 a 6.0, prima di riavviare 
il container si rende necessario svuotare la
directory dei dati locali.
```bash
$ cd /srv/sonarqube
$ mv data/ data_5.6.1
$ mkdir data
```