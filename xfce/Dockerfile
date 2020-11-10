FROM maxpeal/x2go:latest
MAINTAINER Max Peal

ENV DEBIAN_FRONTEND noninteractive

#Install xubuntu desktop for XFCE
#RUN apt-get update -y && apt-get install -y xubuntu-desktop
RUN apt-get update -y && apt-get install -y xfce4 --install-recommends \
       && apt-get install -y xubuntu-desktop --install-recommends
#	&& apt-get install -y xubuntu-desktop --install-recommends
