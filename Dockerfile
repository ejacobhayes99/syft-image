# Dockerfile for Syft SBOM scanner
#
# Build:
#   docker build -t syft:0.1.0 .

FROM alpine:3.23

ARG SYFT_VERSION=1.22.0

RUN apk add --no-cache curl bash jq \
    && curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh \
       | sh -s -- -b /usr/local/bin "v${SYFT_VERSION}" \
    && rm -rf /tmp/syft-* /root/.cache/syft

ENTRYPOINT ["syft"]
