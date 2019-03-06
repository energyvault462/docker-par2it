FROM debian
MAINTAINER brentj433@gmail.com


RUN apt-get update && apt-get -y dist-upgrade && apt-get -y clean && apt-get -y autoremove
RUN apt-get -y install git par2 python-setuptools python-dev curl

# Create custom user
RUN useradd -u 1001 -ms /bin/bash brent && \
	 echo "brent ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER brent
ENV USER brent
ENV PATH $HOME:$PATH
ENV DOCKER true
WORKDIR  /home/brent

RUN git clone https://github.com/energyvault462/par2it.git

WORKDIR /home/brent/par2it

# uncomment this and comment last command to go to shell
#CMD ["/bin/bash"]


CMD ["/bin/sh", "-c", "./runPar"]
