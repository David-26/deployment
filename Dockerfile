FROM kalilinux/kali-rolling

#Label Container
LABEL \
    version="1.0" \
    maintainer="David" \
    name="Kali in Docker"

#Set Timezone
RUN ln -snf /usr/share/zoneinfo/Europe/London /etc/localtime ; \
    echo Europe/London > /etc/timezone

#Install Packages
RUN echo "INFO: Install Packages 1/2" ;\
    apt-get update ;\
    apt-get install kali-desktop-xfce --yes ;\
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo "INFO: Install Packages 2/2" ;\
    apt-get update ;\
    apt-get remove xfce4-power-manager --yes ; \
    apt-get autoremove --yes ;\
    apt-get install xrdp --yes ;\
    apt-get clean && rm -rf /var/lib/apt/lists/*

#Kill Not Stop
STOPSIGNAL SIGKILL

EXPOSE 3389

ADD ./start.sh /root/start.sh
SHELL ["/bin/bash"]
CMD /root/start.sh