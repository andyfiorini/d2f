FROM alpine:latest
MAINTAINER andres.fiorini@altoros.com
RUN apk update && apk add ca-certificates && update-ca-certificates && apk add curl && curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx && mv cf /usr/local/bin && chmod 750 /usr/local/bin/cf
COPY bg.sh /
