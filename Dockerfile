FROM alpine:3.19

# Install required tools
RUN apk add --no-cache \
    bash \
    openssh \
    rsync \
    coreutils \
    findutils

# Copy script
COPY sshdl /usr/local/bin/sshdl
RUN chmod +x /usr/local/bin/sshdl

# Default entrypoint
ENTRYPOINT ["/usr/local/bin/sshdl"]
