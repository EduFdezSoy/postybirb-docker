FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

# INSTALL DEPENDENCIES
RUN apt-get update
RUN apt-get install -y wget jq fuse libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 python3-xdg

# DOWNLOAD APP
ARG FILE_NAME="postybirb-plus.AppImage"
ARG FILE_REPO_API="https://api.github.com/repos/mvdicarlo/postybirb-plus/releases/latest"
RUN wget --no-verbose $(wget -q -O - ${FILE_REPO_API} | jq -r '.assets[] | select (.name | contains ("AppImage")) | .browser_download_url') -O ${FILE_NAME}
RUN chmod +x ${FILE_NAME}
RUN mv ${FILE_NAME} /bin/postybirb

# REMOVE NOT NEEDED TO RUN
RUN apt-get purge -y wget jq
RUN apt-get autoremove -y
RUN apt-get clean

# COPY DEFAULTS
COPY /root /