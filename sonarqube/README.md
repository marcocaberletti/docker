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
