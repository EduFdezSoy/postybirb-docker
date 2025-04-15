FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

ARG FILE_DDL="https://github.com/mvdicarlo/postybirb-plus/releases/download/v3.1.58/postybirb-plus-3.1.58-x86_64.AppImage"

RUN apt-get update
RUN apt-get install -y fuse wget libatk1.0-0
RUN wget ${FILE_DDL} -O postybirb-plus.AppImage
RUN chmod +x postybirb-plus.AppImage
RUN apt-get purge -y wget
RUN apt-get autoremove -y
RUN apt-get clean
