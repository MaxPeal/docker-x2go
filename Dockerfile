FROM ubuntu:18.04
MAINTAINER Max Peal 

ENV DEBIAN_FRONTEND noninteractive

# Update repos
RUN apt-get update -y

# Install requirements
RUN apt-get install -y \
        software-properties-common \
        openssh-server \
        apt-utils \
        sudo \
        nvi

# Upgrade packages
RUN apt-get upgrade -y

# Install X2Go server components
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update -y
RUN apt-get install -y x2goserver x2goserver-xsession --no-install-recommends

# SSH runtime
RUN mkdir /var/run/sshd

# SSH change MaxAuthTries to 10
RUN echo "MaxAuthTries 10" | tee -a /etc/ssh/sshd_config 

# SSH disable PasswordAuthentication
RUN echo "PasswordAuthentication no" | tee -a /etc/ssh/sshd_config

# SSH PermitRootLogin only via key
RUN echo "PermitRootLogin prohibit-password" | tee -a /etc/ssh/sshd_config

# SSH disable root login
#RUN echo "PermitRootLogin no" | tee -a /etc/ssh/sshd_config

#Configure root password
#RUN echo "root:SuperSecureRootPassword" | chpasswd

# Configure default user
RUN adduser --gecos "X2go User" --home /home/x2go --disabled-password x2go
#RUN echo "x2go:x2go" | chpasswd

# allow user x2go sudo without need a password
RUN printf "%b\n" "x2go\tALL = NOPASSWD: ALL\n" | tee -a /etc/sudoers.d/x2go-user

#Desktop Note with credits
RUN mkdir /home/x2go/Desktop
RUN chown x2go:x2go /home/x2go/Desktop
#RUN touch /home/x2go/Desktop/README.txt
#RUN echo -e "To give the user sudo access, run 'su' and use the password 'SuperSecureRootPassword' (You will be told to change this) and then use 'usermod -aG sudo x2go'.\nEnjoy!\n\nThis script was based on the work of https://github.com/bigbrozer - Check out his Github!" | tee /home/x2go/Desktop/README.txt
#RUN chown x2go:x2go /home/x2go/Desktop/README.txt && chmod 777 /home/x2go/Desktop/README.txt

#Expire root password after a day
#RUN chage -d 1 root

# clear existing ssh-host-keys
RUN rm /etc/ssh/ssh_host_*key /etc/ssh/ssh_host_*key.pub ||:

# Run it
EXPOSE 22
CMD ["service ssh start && service x2goserver start"]
CMD ["/bin/sh", "-c", "/usr/bin/ssh-keygen -A && /usr/sbin/sshd -D"]

