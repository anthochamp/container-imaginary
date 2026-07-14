FROM golang:alpine@sha256:0178a641fbb4858c5f1b48e34bdaabe0350a330a1b1149aabd498d0699ff5fb2 AS builder

# This feature is required but not yet released:
# https://github.com/h2non/imaginary/commit/cfbf8d724cd326e835dfcb01e7224397c46037d3
#
# Pin to a specific commit on master branch:
# https://github.com/h2non/imaginary/commits/master/
ARG IMAGINARY_HASH=6cd9edd1d3fb151eb773c14552886e4fc8e50138

# hadolint ignore=DL3018
RUN set -ex; \
	apk add --no-cache \
	vips-dev \
	vips-magick \
	vips-heif \
	vips-jxl \
	vips-poppler \
	build-base; \
	go install github.com/h2non/imaginary@"${IMAGINARY_HASH}";

FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

# hadolint ignore=DL3018
RUN set -ex; \
	apk add --no-cache \
	tzdata \
	ca-certificates \
	netcat-openbsd \
	vips \
	vips-magick \
	vips-heif \
	vips-jxl \
	vips-poppler

COPY --from=builder /go/bin/imaginary /usr/local/bin/
COPY --chmod=775 /rootfs/docker-entrypoint.sh /
COPY --chmod=775 /rootfs/docker-healthcheck.sh /

ENV IMAGINARY_PORT=9000

USER nobody

ENTRYPOINT [ "/docker-entrypoint.sh" ]

HEALTHCHECK \
	CMD /docker-healthcheck.sh || exit 1
