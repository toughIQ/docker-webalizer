# Webalizer
A dockerized version of Webalizer http://www.webalizer.org/

## Setup
Edit __docker-compose.yaml__ to set your paths for _/logs_ and _/webalizer_

Set __ENV__ variables to match your needs:

* DOMAIN: the domain of your site
* INTERVAL: time in seconds between runs. Defaults to __3600__ seconds = 1 hour
* VERBOSE: set to __1__ for detailed output

Webalizer by default only parses the __latest__ logfile. 
This image is built in such a way, that if there is no Webalizer data present in _/webalizer_ it will assume an initial run and parse __all__ availabe logfiles (old to new) provided in _/logs_.

There is also a NginX container to display the results listening on port 8080.

## Run
via Docker CLI:
```
docker run -d \
-v ${PWD}/logs:/logs \
-v ${PWD}/webalizer:/webalizer \
-e DOMAIN=mydomain.com \
-e INTERVAL=3600 \
-e VERBOSE=0 \
toughiq/webalizer:latest
```
or docker-compose:

`docker-compose up -d`

## Logs
`docker-compose logs -f`
