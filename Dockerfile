FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

ARG FILE_REPO_API="https://api.github.com/repos/mvdicarlo/postybirb-plus/releases/latest"
ARG FILE_NAME="postybirb-plus.AppImage"

RUN apt-get update
RUN apt-get install -y wget jq fuse libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0
RUN wget --no-verbose $(wget -q -O - ${FILE_REPO_API} | jq -r '.assets[] | select (.name | contains ("AppImage")) | .browser_download_url') -O ${FILE_NAME}
RUN chmod +x ${FILE_NAME}
RUN apt-get purge -y wget jq
RUN apt-get autoremove -y
RUN apt-get clean
