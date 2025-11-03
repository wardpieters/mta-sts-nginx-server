# MTA-STS nginx server

Lightweight containerized nginx server to publish an MTA-STS policy at `/.well-known/mta-sts.txt`.

## Usage

Create a `docker-compose.yml` file like below. After creating the file, run `docker-compose up -d` to start the service.

```yaml
services:
  mta-sts:
    image: ghcr.io/wardpieters/mta-sts-nginx-server:latest
    ports:
      - 8080:80
    environment:
      - MTA_STS_MX=mail.example.com,mail2.example.com
      - MTA_STS_MODE=enforce
      - MTA_STS_MAX_AGE=86400
      - MTA_STS_VERSION=STSv1
```

Only the `MTA_STS_MX` environment variable is required. The others will default to the values shown above.

That's it! Your MTA-STS policy will be available at `http://localhost:8080/.well-known/mta-sts.txt`. To make it available over HTTPS, you will need to set up a reverse proxy with TLS termination (e.g., using Caddy or another nginx instance).
