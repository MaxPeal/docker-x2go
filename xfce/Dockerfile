FROM maxpeal/x2go:latest
MAINTAINER Max Peal

ENV DEBIAN_FRONTEND noninteractive

#Install xubuntu desktop for XFCE
#RUN apt-get update -y && apt-get install -y xubuntu-desktop
RUN apt-get update -y && apt-get install -y xfce4 xubuntu-desktop --install-recommends
#       && apt-get install -y xfce4 --install-recommends
#	&& apt-get install -y xubuntu-desktop --install-recommends
##RUN apt-get update -y && apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install --reinstall -y 
RUN apt-get update -y && apt-get upgrade -y && echo x2go | xargs dpkg -S | sed 's|, |\n|g;s|: [^:]*$||' | sort | uniq | DEBIAN_FRONTEND=noninteractive xargs apt-get install --reinstall -y
