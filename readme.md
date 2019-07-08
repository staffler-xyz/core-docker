# appleJuice Core

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
        --memory="512Mib" \
        --name ajcore \
        red171/ajcore:latest
```

on first start the [server.xml](files/server.xml) and [settings.xml](files/settings.xml) will be copied to the appleJuice Directory (if not exists from previous or mounted setup)

**Note**: i highly recommend to use [portainer](https://portainer.io) as docker management UI

## java memory limit

the java process takes all resources from the container by default (new java feature since version 8),
so you can easily change the memory limits within docker

```bash
docker update --memory "1024Mib" ajcore
```

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