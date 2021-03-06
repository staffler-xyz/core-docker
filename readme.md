# appleJuice Core

![Docker Pulls](https://img.shields.io/docker/pulls/red171/ajcore.svg)
![Docker Stars](https://img.shields.io/docker/stars/red171/ajcore.svg)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/red171/ajcore.svg)

initial core password: `applejuice`

### Environment Variables

| Variable    | Value           | Description |
|-------------|-----------------|-------------|
| `PUID`      | `1000`          | UserID      |
| `PGID`      | `1000`          | GroupID     |
| `CORE_PORT` | `9850`          | P2P Port    |
| `XML_PORT`  | `9851`          | XML Port    |
| `TZ`        | `Europe/Berlin` | TimeZone    |

## Exposed Ports

- exposed ports are base on `CORE_PORT` and `XML_PORT`, by default:

- `9850` - P2P Port
- `9851` - XML Port

## Volumes

`/config/appleJuice/` contains all important `appleJuice` XML files

## getting started

create and run `ajcore` container with the following command:

```bash
docker run -d -it \
        -p 9850-9851:9850-9851 \
        -v ~/appleJuice/:/config/appleJuice/ \
        --memory="2GB" \
        --name ajcore \
        red171/ajcore:latest
```

on first start the [settings.xml](rootfs/app/settings.xml) will be copied to the appleJuice Directory (if not exists from previous or mounted setup)

## java memory limit

the java process takes `98%` resources from the container by default (new java feature since version 8),
so you can easily change the memory limits within docker

```bash
docker update --memory "4GB" ajcore
```

## shared volumes

you can mount every folder on your host system to some place in this container, 

eg. `-v /mnt/data/movies/:/mnt/data/movies/`

and add the now mounted path inside the container as new share with any appleJuice GUI, eg. [red171/ajgui-php](https://hub.docker.com/r/red171/ajgui-php)

## change password

- attach to running container with `docker attach ajcore` or your docker management UI 
- enter `chpw` and change your password
- finally press `Ctrl`+`p` followed by `Ctrl`+`q` to dettach from container
