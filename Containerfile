ARG ALPINE_CHANNEL=edge
FROM alpine:${ALPINE_CHANNEL} AS build

ARG ALPINE_CHANNEL
ARG APP_VERSION=1.4-r1

RUN --mount=type=tmpfs,target=/extract_root/etc/apk \
    --mount=type=tmpfs,target=/extract_root/lib/apk \
    --mount=type=tmpfs,target=/extract_root/var <<EOF
apk add --no-cache --root /extract_root --initdb --keys-dir /etc/apk/keys \
    -X "http://dl-cdn.alpinelinux.org/alpine/${ALPINE_CHANNEL}/main" \
    -X "http://dl-cdn.alpinelinux.org/alpine/${ALPINE_CHANNEL}/community" \
    radeontop=${APP_VERSION}
EOF

FROM scratch

COPY --from=build /extract_root /

ENTRYPOINT [ "/usr/bin/radeontop", "-c" ]
