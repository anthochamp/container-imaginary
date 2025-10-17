FROM golang:alpine@sha256:aee43c3ccbf24fdffb7295693b6e33b21e01baec1b2a55acc351fde345e9ec34 AS builder

# this one is required but non-released :
# https://github.com/h2non/imaginary/commit/cfbf8d724cd326e835dfcb01e7224397c46037d3
#
# set to latest commit on master branch
# https://github.com/h2non/imaginary/commits/master/
ENV IMAGINARY_HASH=6cd9edd1d3fb151eb773c14552886e4fc8e50138

# hadolint ignore=DL3018
RUN set -ex; \
	apk add --no-cache \
	vips-dev \
	vips-magick \
	vips-heif \
	vips-jxl \
	vips-poppler \
	build-base; \
	go install github.com/h2non/imaginary@"$IMAGINARY_HASH";

FROM alpine:3.22.2@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

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

COPY --from=builder /go/bin/imaginary /usr/local/bin/imaginary
COPY --chmod=775 /rootfs/docker-entrypoint.sh /
COPY --chmod=775 /rootfs/docker-healthcheck.sh /

ENV IMAGINARY_PORT=9000

USER nobody

ENTRYPOINT [ "/docker-entrypoint.sh" ]

HEALTHCHECK \
	CMD /docker-healthcheck.sh || exit 1
