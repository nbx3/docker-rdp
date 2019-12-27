FROM ubuntu:disco
MAINTAINER nick@incension.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
    	xrdp \
	openbox \
	obconf \
	obmenu \
	openbox-menu \
	dunst \
	xinput \
	tint2 \
	supervisor \
	dbus-x11 \
	dbus-user-session \
	git \
	curl \
	sudo \
	iputils-ping \
	vim && \
    apt-get clean

ADD supervisor.conf /etc/supervisor/conf.d/xrdp.conf
ADD skel-config/ /etc/skel/
ADD config/locale /etc/default/
ADD config/xrdp.ini /etc/xrdp/xrdp.ini
ADD config/sesman.ini /etc/xrdp/sesman.ini

RUN useradd -mp j9X2HRQvPCphA -s /bin/bash -G sudo nick

RUN xrdp-keygen xrdp auto && \
    mkdir -p /var/run/dbus
   
CMD ["supervisord", "-n"]

EXPOSE 3389

