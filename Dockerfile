FROM fedora:latest
MAINTAINER nick@incension.com

RUN dnf update -y && \
    dnf -y install \
	   xrdp \
	    openbox \
	    obconf \
	    dunst \
	    xinput \
	    tint2 \
	    procps-ng \
	    dbus-daemon \
	    dbus-x11 \
	    supervisor \
	    git \
	    vim-enhanced && \
    dnf clean all

ADD supervisor.conf /etc/supervisord.d/xrdp.ini
ADD config/ /etc/skel/

RUN useradd -mp j9X2HRQvPCphA -s /bin/bash -G wheel nick

RUN xrdp-keygen xrdp auto
RUN mkdir -p /run/dbus

CMD ["supervisord", "-n"]

EXPOSE 3389

