NAMESPACE ?= djangoyi
IMAGE ?= k8s-dev-ubuntu
GOVERSION ?= 1.21.5

default:
	docker buildx build --platform linux/amd64 --build-arg GOVERSION=$(GOVERSION) . -t $(NAMESPACE)/$(IMAGE):go$(GOVERSION) --load

test: default
	docker push $(NAMESPACE)/$(IMAGE):go$(GOVERSION)
