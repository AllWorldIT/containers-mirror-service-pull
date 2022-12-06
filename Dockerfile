FROM registry.gitlab.iitsp.com/allworldit/docker/alpine:latest

ARG VERSION_INFO=
LABEL maintainer="Nigel Kukard <nkukard@lbsd.net>"

RUN set -ex; \
	true "Rsync"; \
	apk add --no-cache rsync curl; \
	true "Versioning"; \
	if [ -n "$VERSION_INFO" ]; then echo "$VERSION_INFO" >> /.VERSION_INFO; fi; \
	true "Cleanup"; \
	rm -f /var/cache/apk/*

RUN set -ex; \
	true "Setup upload user"; \
	addgroup -g 1001 pull; \
	adduser -u 1001 -D -h /home/pull -G pull pull; \
	chmod 0700 /home/pull; \
	true "Setup data directory"; \
	mkdir -p /data

VOLUME ["/data"]

