FROM maxpeal/x2go:latest
MAINTAINER Max Peal

ENV DEBIAN_FRONTEND noninteractive

 # fix so resolvconf can be configured
 RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections


#Install ubuntu mate desktop for MATE + extras
#RUN apt-get update -y && apt-get install -y ubuntu-mate-desktop x2gomatebindings 
#RUN apt-get update -y && apt-get install -y ubuntu-mate-desktop x2gomatebindings --install-recommends
#RUN apt-get update -y && apt-get install -y ubuntu-mate-desktop --install-recommends
RUN apt-get update -y && apt-get install -y ubuntu-mate-core ubuntu-mate-desktop --install-recommends

RUN apt-get update -y && apt-get upgrade -y && echo x2go | xargs dpkg -S | sed 's|, |\n|g;s|: [^:]*$||' | sort | uniq | DEBIAN_FRONTEND=noninteractive xargs apt-get install --reinstall -y


