FROM alpine:3.19

# Install required tools
RUN apk add --no-cache \
    bash \
    openssh \
    rsync \
    coreutils \
    findutils

RUN addgroup -g 100 users && \
    adduser -D -u 99 -G users nobody

# Copy script
COPY rsyncdl /usr/local/bin/rsyncdl
RUN chmod +x /usr/local/bin/rsyncdl

# Default entrypoint
ENTRYPOINT ["/usr/local/bin/rsyncdl"]
