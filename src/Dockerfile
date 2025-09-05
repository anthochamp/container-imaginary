FROM golang:alpine@sha256:b6ed3fd0452c0e9bcdef5597f29cc1418f61672e9d3a2f55bf02e7222c014abd AS builder

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

FROM alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

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
