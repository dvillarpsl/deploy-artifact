FROM node:11-alpine

RUN echo "ipv6" >> /etc/modules

RUN apk add --no-cache \
  python \
  py-pip \
  py-setuptools \
  ca-certificates \
  openssl \
  groff \
  less \
  bash \
  curl \
  jq \
  git \
  openssh \
  zip && \
  pip install --no-cache-dir --upgrade pip awscli && \
  aws configure set preview.cloudfront true

RUN apk update

ENV TERRAFORM_VERSION 0.12.10
ENV PACKER_VERSION 1.2.4

RUN wget -O packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
  unzip packer.zip -d /usr/local/bin/packer && \
  rm -f packer.zip
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin/terraform && \
  rm -f terraform.zip

ENTRYPOINT ["/bin/bash", "-c"]