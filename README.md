# nginx-rtmp-example

## Pre-requirements

Installed [Docker](https://www.docker.com/get-started).
Optionally you can have installed [make](https://en.wikipedia.org/wiki/Make_(software))
to use Makefile for build/run Docker image.

## Command line based workflow

Build image.
```shell
docker build --force-rm -t sv-tv/nginx-rtmp-example -f Dockerfile .
```

Run image without a mounted dir:
```shell
docker run -it -p 1935:1935 -p 8080:8080 --name nginx-rtmp-example --rm sv-tv/nginx-rtmp-example
```

Run image with a mounted host dir:
```shell
docker run -it -p 1935:1935 -p 8080:8080 -v FULL_PATH_TO_DIR:/out --name nginx-rtmp-example --rm sv-tv/nginx-rtmp-example
```

Connect to the running container:
```shell
docker exec -it nginx-rtmp-example sh
```

## Makefile based workflow

Build image.
```shell
make image
```

Run image without a mounted dir:
```shell
make run
```

Run image with a mounted dir:
```shell
MNT=FULL_PATH_TO_DIR make run
```

Connect to the running container:
```shell
make exec
```

## Usage

Use rtmp://localhost/stream/STREAM_NAME as broadcast entrypoint.
Broadcast will be stored in /out dir in the container or in specified host dir.
Stat page located at http://localhost:8080/stat
