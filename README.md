# DEPRECATION NOTICE
> [!warning]
> This repository is deprecated and won't be updated anymore!

# CrushFTP for Docker

[![Docker Automated build](https://img.shields.io/docker/automated/shokinn/crushftp.svg)](https://hub.docker.com/r/shokinn/crushftp/)
[![Docker Build Status](https://img.shields.io/docker/build/shokinn/crushftp.svg)](https://hub.docker.com/r/shokinn/crushftp/)
[![Docker image version](https://images.microbadger.com/badges/version/shokinn/crushftp.svg)](https://microbadger.com/images/shokinn/crushftp)
[![Docker image size](https://images.microbadger.com/badges/image/shokinn/crushftp.svg)](https://microbadger.com/images/shokinn/crushftp)

Docker image for CrushFTP server. Installs dependencies, including Java with unlimited JCE.

**Note:** This repository does not directly include any of the aforementioned copyrighted products, rather, it downloads them from the servers of their respective developers at buildtime. By using this container, you agree to any licence terms they may have.

This container, itself, is distributed under the [MIT Licence](LICENSE).

## Environment variables

| Variable               | Description               | Default      |
|:-----------------------|:--------------------------|:-------------|
| `CRUSH_ADMIN_USER`     | Admin user of CrushFTP    | `crushadmin` |
| `CRUSH_ADMIN_PASSWORD` | Password for admin user   | `crushadmin` |
| `CRUSH_ADMIN_PROTOCOL` | Protocol for health cecks | `http`       |
| `CRUSH_ADMIN_PORT`     | Port for health cecks     | `8080`       |

## Installation
Run this container and share the containers `/var/opt/CrushFTP9` directory, which persists CrushFTP's configuration, to an appropriate location on the host. Open a browser and go to http://localhost:8080. Note that the default username and password are both `crushadmin`.

This command will create a new container and expose all ports. Remember to change the `<volume>` to a location on your host machine.

```
docker run -p 21:21 -p 443:443 -p 2222:2222 -p 8080:8080 -p 9090:9090 -v <volume>:/var/opt/CrushFTP9 shokinn/crushftp:latest
```
