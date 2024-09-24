NAMESPACE ?= djangoyi
IMAGE ?= k8s-dev-ubuntu
GOVERSION ?= 1.21.5

default:
	docker buildx build --platform linux/amd64 --build-arg GOVERSION=$(GOVERSION) . -t $(NAMESPACE)/$(IMAGE):go$(GOVERSION) --load

test: default
	docker push $(NAMESPACE)/$(IMAGE):go$(GOVERSION)

start-dmp: remove-redis
	kubectl apply -f dmp/dev-dmp.yaml

remove-dmp:
	kubectl delete -f dmp/dev-dmp.yaml

install-pg:
	helm upgrade pg-dmp bitnami/postgresql -f dmp/pg-values.yaml --install

remove-pg:
	helm uninstall pg-dmp

start-redis: remove-dmp
	kubectl apply -f redis/dev-redis.yaml

remove-redis:
	kubectl delete -f redis/dev-redis.yaml