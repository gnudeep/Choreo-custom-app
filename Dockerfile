# Use a base image with DNSPerf and other dependencies pre-installed
FROM alpine:latest

# Install DNSPerf
RUN apk add --no-cache dnsperf

# Create a non-root user
RUN adduser -D -u 19001 dnsperfuser

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script as the Docker entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Set the user to the non-root user
USER dnsperfuser

