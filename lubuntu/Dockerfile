FROM maxpeal/x2go:latest
MAINTAINER Max Peal

ENV DEBIAN_FRONTEND noninteractive

# Install Lubuntu  suite
RUN apt-get update -y && apt-get install -y lubuntu-desktop --install-recommends
#RUN apt-get update -y && apt-get install -y lubuntu-desktop x2golxdebindings

RUN apt-get update -y && apt-get upgrade -y && echo x2go | xargs dpkg -S | sed 's|, |\n|g;s|: [^:]*$||' | sort | uniq | DEBIAN_FRONTEND=noninteractive xargs apt-get install --reinstall -y

