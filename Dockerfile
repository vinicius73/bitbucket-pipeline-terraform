FROM hashicorp/terraform:1.1.9

RUN apk --no-cache --update add build-base

LABEL name="bitbucket-pipeline-terraform" \
  description="A simple terraform image with build tools" \
  vcs.url="https://github.com/vinicius73/bitbucket-pipeline-terraform"