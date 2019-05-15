# Kontena-Logger :mag_right:

A simple service to expose kontena service logs to web.

[![Build Status](https://drone.quving.com/api/badges/Quving/kontena-logger/status.svg)](https://drone.quving.com/Quving/kontena-logger)

<img src="https://i.imgur.com/B05KJOE.png" width="250"/>

## Required Environment-Variables
The kontena authentication is the same as kontena's. Setting the following environment variables is sufficient.
- KONTENA_GRID
- KONTENA_TOKEN
- KONTENA_URL

In order to specify which service is to log, the following variable is necessary to set.
- KONTENA_SERVICE


## Launch
```
docker run -e KONTENA_GRID='...' \
  -e KONTENA_URL='...' \
  -e KONTENA_TOKEN='...' \
  -e KONTENA_SERVICE='...' \
  -p 80:9100 \
  pingu/kontena-logger:latest
```
