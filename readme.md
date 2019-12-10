# appleJuice Core

![Docker Pulls](https://img.shields.io/docker/pulls/red171/ajcore.svg)
![Docker Stars](https://img.shields.io/docker/stars/red171/ajcore.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/red171/ajcore.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/red171/ajcore.svg)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/red171/ajcore.svg)

initial core password: `applejuice`

## Exposed Ports

- `9850` - P2P Port
- `9851` - XML Port

## Volumes

`/config/appleJuice/` contains all important `ajcore` files

## getting started

create and run `ajcore` container with the following command:

```bash
docker run -d -it \
        -p 9850-9851:9850-9851 \
        -v ~/appleJuice/:/config/appleJuice/ \
        -e JAVA_OPTIONS="-Xmx2048m" \
        --name ajcore \
        red171/ajcore:latest
```

on first start the [server.xml](files/server.xml) and [settings.xml](files/settings.xml) will be copied to the appleJuice Directory (if not exists from previous or mounted setup)

**Note**: i highly recommend to use [portainer](https://portainer.io) as docker management UI

## java memory limit

just add the `environment` Variable `JAVA_OPTIONS` with the `-Xmx` Memory Variable

## shared volumes

you can mount every folder on your host system to some place in this container, 

eg. `-v /mnt/data/movies/:/mnt/data/movies/`

and add the now mounted path inside the container as new share with any appleJuice GUI, eg. [red171/ajgui-php](https://hub.docker.com/r/red171/ajgui-php)


## change password

- attach to running container with `docker attach ajcore` or your docker management UI 
- enter `chpw` and change your password
- finally press `Ctrl`+`p` followed by `Ctrl`+`q` to dettach from container

## logs

get latest `ajcore` output: `docker logs ajcore`
get real time `ajcore` output: `docker logs -f ajcore` (`Ctrl`+`c` to exit)