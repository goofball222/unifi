-include ../*.mk
-include *.mk



NS ?= goofball222

IMAGE_NAME ?= unifi
CONTAINER_NAME ?= unifi
CONTAINER_INSTANCE ?= default

VCS_REF := $(strip $(shell git rev-parse --short HEAD))
BUILD_DATE := $(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ"))
UNIFI_VERSION := $(strip $(shell cat UNIFI_VERSION))

ifndef UNIFI_VERSION
$(error You need to create a UNIFI_VERSION file to build a release)
endif

ifndef TAG
TAG := $(notdir $(shell pwd))
endif



.PHONY: build shell debug run start stop rm test



default: build



build:
	@docker build \
	--build-arg VCS_REF=$(VCS_REF) \
	--build-arg BUILD_DATE=$(BUILD_DATE) \
	--build-arg UNIFI_VERSION=$(UNIFI_VERSION) \
	-t $(NS)/$(IMAGE_NAME):$(TAG) .

shell:
	docker run -it --rm --name $(CONTAINER_NAME)_$(CONTAINER_INSTANCE) --entrypoint "/bin/bash" $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(TAG)

run:
	docker run --rm --name $(CONTAINER_NAME)_$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(TAG)

start:
	docker run -d --name $(CONTAINER_NAME)_$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(TAG)

stop:
	docker stop $(CONTAINER_NAME)_$(CONTAINER_INSTANCE)

rm:
	docker rm $(CONTAINER_NAME)_$(CONTAINER_INSTANCE)

test:
	@echo docker build \
	--build-arg VCS_REF=$(VCS_REF) \
	--build-arg BUILD_DATE=$(BUILD_DATE) \
	--build-arg UNIFI_VERSION=$(UNIFI_VERSION) \
	-t $(NS)/$(IMAGE_NAME):$(TAG) .
