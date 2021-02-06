FROM openjdk:11-slim-buster
LABEL maintainer="mail@philip-henning.com"

RUN \
	apk --no-cache upgrade \
	&& apk --no-cache add \
		bash \
		bash-completion \
		bash-doc \
		ca-certificates \
		curl \
		wget \
	&& update-ca-certificates

RUN wget -O /tmp/CrushFTP9.zip https://www.crushftp.com/early9/CrushFTP9.zip
ADD ./setup.sh /var/opt/setup.sh

RUN chmod +x /var/opt/setup.sh

VOLUME [ "/var/opt/CrushFTP9" ]

#ENTRYPOINT /var/opt/setup.sh
ENTRYPOINT [ "/bin/bash", "/var/opt/setup.sh" ]
CMD ["-c"]

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f ${CRUSH_ADMIN_PROTOCOL}://localhost:${CRUSH_ADMIN_PORT}/favivon.ico -H 'Connection: close' || exit 1

ENV CRUSH_ADMIN_PROTOCOL http
ENV CRUSH_ADMIN_PORT 8080

EXPOSE 21 443 2222 8080 8888 9022 9090

# Metadata.
ARG BUILD_DATE
ARG IMAGE_VERSION
ARG IMG_TITLE

LABEL \
	org.opencontainers.image.created="${BUILD_DATE}" \
	org.opencontainers.image.vendor="Philip Henning" \
	org.opencontainers.image.authors="Philip Henning <mail@philip-henning.com>" \
	org.opencontainers.image.title="${IMG_TITLE}" \
	org.opencontainers.image.description="A minimal docker image to build a MkDocs based documentation" \
	org.opencontainers.image.version="${IMAGE_VERSION}" \
	org.opencontainers.image.source="https://github.com/shokinn/Docker-CrushFTP" \
	org.opencontainers.image.revision="${IMAGE_VERSION}" \
	org.opencontainers.image.licenses="MIT"
