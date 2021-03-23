DOCKER_HUB_REPO=vinicius73/bitbucket-pipeline-terraform

define buildDocker
	docker build -t ${DOCKER_HUB_REPO}:$(shell cat .version) .
endef

build:
	- @cp Dockerfile.template Dockerfile
	- @echo "What is the terraform version?"; \
		read VERSION; \
		sed -i "s#<VERSION>#$$VERSION#g" Dockerfile; \
		echo rm -rf .version; \
		echo $$VERSION > .version;
	- $(call buildDocker)