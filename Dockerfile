# Dockerfile: hombre-appdaemon

FROM hombrelab/hombre-python

ARG version

LABEL version="${version}"
LABEL description="Appdaemon Docker image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

RUN apk add --no-cache \
    git \
    build-base \
    curl \
    tzdata \
    gcc \
    libffi-dev \
    openssl-dev \
    musl-dev \
    cargo \
    && git clone https://github.com/home-assistant/appdaemon.git /usr/src/app

EXPOSE 5050

VOLUME /conf
VOLUME /certs

WORKDIR /usr/src/app

RUN pip3 install appdaemon

RUN chmod +x /usr/src/app/dockerStart.sh

ENTRYPOINT ["./dockerStart.sh"]
