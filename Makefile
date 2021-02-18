CONTAINER_NAME=nginx-rtmp-example
TAG=sv-tv/$(CONTAINER_NAME)

all: help

.PHONY: help image run exec

help:
	@echo "image                - build image"
	@echo "run                  - run image $(TAG) as $(CONTAINER_NAME) with mounted MNT to /mnt in container"
	@echo "run                    MNT must be full path to the dir"
	@echo "exec                 - connect to $(CONTAINER_NAME)"

image:
	@docker build --force-rm -t $(TAG) -f Dockerfile .

run:
	docker run -it -p 1935:1935 -p 8080:8080 -v $(MNT):/out --name $(CONTAINER_NAME) --rm $(TAG)

exec:
	docker exec -it $(CONTAINER_NAME) sh
