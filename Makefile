DOCKER_HUB_REPO=vinicius73/bitbucket-pipeline-terraform

define build
	docker build -t ${DOCKER_HUB_REPO}:$(shell cat .version) .
endef

generate:
	- @cp Dockerfile.template Dockerfile
	- @echo "What is the terraform version?"; \
		read VERSION; \
		sed -i "s#<VERSION>#$$VERSION#g" Dockerfile; \
		echo $$VERSION > .version

build: generate
- $(call build)