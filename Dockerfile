# Version: 0.0.1
FROM jboss/base-jdk:7
MAINTAINER Ihor Lavryniuk <sp.titan@gmail.com>

ENV FUSE_VERSION 6.1.0.redhat-379
# If the container is launched with re-mapped ports, these ENV vars should
# be set to the remapped values.
ENV FUSE_PUBLIC_OPENWIRE_PORT 61616
ENV FUSE_PUBLIC_MQTT_PORT 1883
ENV FUSE_PUBLIC_AMQP_PORT 5672
ENV FUSE_PUBLIC_STOMP_PORT 61613
ENV FUSE_PUBLIC_OPENWIRE_SSL_PORT 61617
ENV FUSE_PUBLIC_MQTT_SSL_PORT 8883
ENV FUSE_PUBLIC_AMQP_SSL_PORT 5671
ENV FUSE_PUBLIC_STOMP_SSL_PORT 61614

WORKDIR /
# Install fuse in the image.
USER root
ADD downloads/jboss-fuse-6.1.0.redhat-379 /opt/jboss-fuse-6.1.0.redhat-379
#
# The following directories can hold config/data, so lets suggest the user
# mount them as volumes.
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/bin
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/etc
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/data
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/deploy

# lets default to the jboss-fuse dir so folks can more easily navigate to around the server install
WORKDIR /
ENTRYPOINT ["/opt/jboss-fuse-6.1.0.redhat-379/bin/fuse"]
CMD ["server"]
