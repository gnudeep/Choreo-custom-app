# Use a base image with DNSPerf and other dependencies pre-installed
FROM alpine:latest

# Enable the testing repository
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install dnsperf from the testing repository
RUN apk update && apk add --no-cache dnsperf@testing

# Create a non-root user
RUN adduser -D -u 19001 dnsperfuser

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh


# Set the user to the non-root user

USER 19001 

# Set the entrypoint script as the Docker entrypoint
ENTRYPOINT ["/entrypoint.sh"]


