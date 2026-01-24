FROM alpine:3.19

# Install required tools
RUN apk add --no-cache \
    bash \
    openssh \
    rsync \
    coreutils \
    findutils

RUN adduser -D -u 99 -G users unraid

# Copy script
COPY rsyncdl /usr/local/bin/rsyncdl
RUN chmod +x /usr/local/bin/rsyncdl
RUN chown 99:100 /usr/local/bin/rsyncdl

# Default entrypoint
ENTRYPOINT ["/usr/local/bin/rsyncdl"]
