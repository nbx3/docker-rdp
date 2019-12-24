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
	git \
	vim && \
    apt-get clean

ADD supervisor.conf /etc/supervisor/conf.d/xrdp.conf
ADD config/ /etc/skel/

RUN useradd -mp j9X2HRQvPCphA -s /bin/bash -G sudo nick

RUN xrdp-keygen xrdp auto

CMD ["supervisord", "-n"]

EXPOSE 3389

