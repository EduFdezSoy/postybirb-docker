FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

ARG FILE_DDL="https://github.com/mvdicarlo/postybirb-plus/releases/download/v3.1.58/postybirb-plus-3.1.58-x86_64.AppImage"
ARG FILE_NAME="postybirb-plus.AppImage"

RUN apt-get update
RUN apt-get install -y fuse wget libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0
RUN wget --no-verbose ${FILE_DDL} -O ${FILE_NAME}
RUN chmod +x ${FILE_NAME}
RUN apt-get purge -y wget
RUN apt-get autoremove -y
RUN apt-get clean
