# HEADER
FROM        gliderlabs/alpine
MAINTAINER  patrick@rutledge.name

# Trigger rebuild
ENV         UPDATED_AT 2015-07-11

# Install Quagga
RUN         apk-install quagga \
                        supervisor

# Supervisord
ADD         supervisord.conf /etc/supervisord.conf

# Configuration files
VOLUME /etc/quagga

# Expose ports
EXPOSE 179 2601 2605 89/ip

# Command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
