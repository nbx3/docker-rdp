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
	    supervisor \
	    git \
	    vim-enhanced && \
    dnf clean all

ADD supervisor.conf /etc/supervisor/conf.d/xrdp.conf
ADD config/ /etc/skel/

RUN useradd -mp j9X2HRQvPCphA -s /bin/bash -G wheel nick

RUN xrdp-keygen xrdp auto

CMD ["supervisord", "-n"]

EXPOSE 3389

