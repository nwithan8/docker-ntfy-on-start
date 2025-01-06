FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="https://github.com/nwithan8"
LABEL org.opencontainers.image.source="https://github.com/nwithan8/docker-ntfy-on-start"

ENV NTFY_URL=""
ENV NTFY_ACCESS_TOKEN=""
ENV NTFY_TOPIC="server"
ENV NTFY_TITLE="Startup Complete"
ENV NTFY_MESSAGE="Server is now Online!"
ENV NTFY_PRIORITY="3"
ENV UID=99
ENV GID=100
ENV DATA_PERM=770
ENV USER="ntfy"

RUN useradd -s /bin/bash $USER

ADD /scripts/ /opt/scripts/
RUN chmod -R 777 /opt/scripts/

RUN apt-get -y update && apt-get -y install curl

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]
