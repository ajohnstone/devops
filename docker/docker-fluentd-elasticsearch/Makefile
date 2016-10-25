NAME = photobox/fluentd-elasticsearch
VERSION = 1.21
REGISTRY=XXX.dkr.ecr.eu-west-1.amazonaws.com

.PHONY: all build release

all: build

build:
	docker build -t $(NAME):$(VERSION) --rm .;
	docker tag $(NAME):$(VERSION) $(NAME):latest
	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)

release:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	aws ecr get-login | sh
	aws ecr create-repository --repository-name=$(NAME) > /dev/null 2>&1 || /bin/true
	docker push $(REGISTRY)/$(NAME)
