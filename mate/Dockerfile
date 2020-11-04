
FROM maxpeal/x2go
MAINTAINER Max Peal

 # fix so resolvconf can be configured
 RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections


#Install ubuntu mate desktop for MATE + extras
RUN apt-get update -y && apt-get install -y ubuntu-mate-desktop x2gomatebindings
