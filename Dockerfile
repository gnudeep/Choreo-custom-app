
# Use a base image with DNSPerf and other dependencies pre-installed
FROM alpine:latest

# Install DNSPerf
RUN apk add --no-cache dnsperf

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script as the Docker entrypoint
ENTRYPOINT ["/entrypoint.sh"]
