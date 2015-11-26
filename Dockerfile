# Version: 0.0.1
FROM i452/jboss-fuse-6.1.0.redhat-379:virgin-root
MAINTAINER Ihor Lavryniuk <sp.titan@gmail.com>

#ENV FUSE_VERSION 6.1.0.redhat-379
#ENV FUSE_HOME /opt/jboss/jboss-fuse-$FUSE_VERSION
# If the container is launched with re-mapped ports, these ENV vars should
# be set to the remapped values.

#WORKDIR /
# Install fuse in the image.
#COPY install.sh /opt/install.sh
#RUN /opt/install.sh

#USER root
#RUN apt-get update && apt-get install -y tree
#RUN set -ex; \
#	yum install -y nmap net-tools openssh-clients; yum clean all;
#RUN iptables -I INPUT -p tcp -m tcp --dport 8101 -j ACCEPT; \
#	service iptables save;
#	service iptables restart
RUN sed -i "\$ashell:source https://raw.githubusercontent.com/452/shscripts/master/.bashrcFuse.sh" /opt/jboss-fuse-6.1.0.redhat-379/etc/shell.init.script
RUN sed -i "\$asource <(curl -s https://raw.githubusercontent.com/452/shscripts/master/.bashrc)" /root/.bashrc
RUN sed -i "\$afuse=fuse,admin" /opt/jboss-fuse-6.1.0.redhat-379/etc/users.properties
#EXPOSE 8080 8181 8182 8101 1099 44444 61616 1883 5672 61613 61617 8883 5671 61614
#
# The following directories can hold config/data, so lets suggest the user
# mount them as volumes.
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/bin
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/etc
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/data
#VOLUME /opt/jboss-fuse-6.1.0.redhat-379/deploy

# lets default to the jboss-fuse dir so folks can more easily navigate to around the server install
#ENTRYPOINT ["/opt/jboss-fuse-6.1.0.redhat-379/bin/fuse"]
#CMD ["server"]

#ENTRYPOINT ["/bin/bash"]
