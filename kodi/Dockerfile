FROM dbertolotto/debian:stretch-minbase

RUN apt-get update && \
    apt-get install -y kodi && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# setup users, groups and permissions
RUN groupadd --gid 1000 kodi && \
    useradd --uid 1000 --gid 1000 --home /home/kodi kodi
    usermod -a -G cdrom,audio,video,plugdev,users,dialout,dip,input,netdev kodi

# add config file
RUN mkdir -p /home/kodi/.kodi/userdata && \
    chown -R kodi:kodi /home/kodi && \
    chmod -R 0750 /home/kodi
COPY advancedsettings.xml /home/kodi/.kodi/userdata/advancedsettings.xml
RUN chown root:kodi /home/kodi/.kodi/userdata/advancedsettings.xml && \
    chmod 0640 /home/kodi/.kodi/userdata/advancedsettings.xml

USER kodi
CMD kodi
