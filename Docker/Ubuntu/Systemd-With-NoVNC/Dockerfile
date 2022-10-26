# ADAPTED FROM https://github.com/robertdebock/docker-ubuntu-systemd/
# (To add NoVNC)
#

FROM ubuntu:22.04

LABEL maintainer="JohnB <johnb@johnbdev.cf>"
LABEL build_date="2022-10-26"

ARG DEBIAN_FRONTEND=noninteractive
ENV container docker

# Enable apt repositories.
RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

# Enable systemd.
RUN apt-get update ; \
    apt-get install -y systemd systemd-sysv ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    cd /lib/systemd/system/sysinit.target.wants/ ; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]

# Install xfce and NoVNC
RUN apt-get update ; \
    apt-get install -y xfce4 xfce4-goodies ; \
    apt-get install -y tightvncserver autocutsel

# Setup root password from PASSWORD env
COPY setpassword.sh .
RUN chmod +x /setpassword.sh
CMD ["/setpassword.sh"]

# Set VNC startup file
COPY xstartup /root/.vnc/xstartup
RUN chmod 755 ~/.vnc/xstartup

# VNC server service
COPY vncserver@.service /etc/systemd/system/vncserver@.service
RUN systemctl enable vncserver@root ; \
    systemctl start vncserver@root

# Install NoVNC
RUN apt-get update ; \
    apt install snapd ; \
    snap install novnc

RUN novnc --listen 6900 --vnc localhost:5900